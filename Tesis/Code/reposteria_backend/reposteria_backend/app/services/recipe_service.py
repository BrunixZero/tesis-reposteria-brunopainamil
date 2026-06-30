"""
Lógica de negocio para escalado de recetas y cálculo de cotizaciones.
"""
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
from sqlalchemy.orm import selectinload
from app.models import Recipe, RecipeIngredient, Ingredient, Quote, QuoteItem
from app.schemas import QuoteCreate
import uuid


async def scale_recipe(recipe_id: uuid.UUID, servings: int, db: AsyncSession) -> dict:
    """
    Escala los ingredientes de una receta a las porciones solicitadas.
    Retorna un dict con ingredientes escalados.
    """
    result = await db.execute(
        select(Recipe)
        .options(selectinload(Recipe.ingredients).selectinload(RecipeIngredient.ingredient))
        .where(Recipe.id == recipe_id)
    )
    recipe = result.scalar_one_or_none()
    if not recipe:
        return None

    scale_factor = servings / recipe.base_servings
    scaled_ingredients = []

    for ri in recipe.ingredients:
        scaled_ingredients.append({
            "ingredient_id":   str(ri.ingredient_id),
            "name":            ri.ingredient.name,
            "quantity_base":   ri.quantity,
            "quantity_scaled": round(ri.quantity * scale_factor, 2),
            "unit":            ri.unit,
            "notes":           ri.notes,
            "unit_cost":       ri.ingredient.price_per_unit,
            "subtotal":        round(ri.quantity * scale_factor * ri.ingredient.price_per_unit, 0),
        })

    return {
        "recipe_id":          str(recipe.id),
        "recipe_name":        recipe.name,
        "original_servings":  recipe.base_servings,
        "requested_servings": servings,
        "scale_factor":       scale_factor,
        "ingredients":        scaled_ingredients,
    }


async def calculate_quote(data: QuoteCreate, user_id: uuid.UUID, db: AsyncSession) -> Quote:
    """
    Genera una cotización completa para una receta escalada.
    Fórmula precio final:
        ingredient_cost × (1 + overhead/100) × (1 + margin/100)
    """
    scaled = await scale_recipe(data.recipe_id, data.servings_requested, db)
    if not scaled:
        return None

    ingredient_cost = sum(i["subtotal"] for i in scaled["ingredients"])
    final_price = ingredient_cost * (1 + data.overhead_pct / 100) * (1 + data.margin_pct / 100)

    quote = Quote(
        user_id=user_id,
        recipe_id=data.recipe_id,
        client_name=data.client_name,
        client_email=data.client_email,
        servings_requested=data.servings_requested,
        ingredient_cost=round(ingredient_cost, 0),
        overhead_pct=data.overhead_pct,
        margin_pct=data.margin_pct,
        final_price=round(final_price, 0),
        notes=data.notes,
        status="draft",
    )
    db.add(quote)
    await db.flush()  # para obtener quote.id antes del commit

    for ing in scaled["ingredients"]:
        item = QuoteItem(
            quote_id=quote.id,
            ingredient_id=uuid.UUID(ing["ingredient_id"]),
            quantity_needed=ing["quantity_scaled"],
            unit=ing["unit"],
            unit_cost=ing["unit_cost"],
            subtotal=ing["subtotal"],
        )
        db.add(item)

    await db.commit()
    await db.refresh(quote)
    return quote


async def get_substitutes(ingredient_id: uuid.UUID, vegan_only: bool, gluten_free_only: bool, db: AsyncSession) -> list:
    """
    Devuelve los sustitutos de un ingrediente, filtrados y ordenados por similarity_score.
    """
    from app.models import Substitute
    query = (
        select(Substitute, Ingredient)
        .join(Ingredient, Ingredient.id == Substitute.substitute_id)
        .where(Substitute.original_id == ingredient_id)
    )
    if vegan_only:
        query = query.where(Substitute.vegan_safe == True)
    if gluten_free_only:
        query = query.where(Substitute.gluten_free_safe == True)

    query = query.order_by(Substitute.similarity_score.desc())
    result = await db.execute(query)
    rows = result.all()

    return [
        {
            "substitute_id":    str(sub.substitute_id),
            "substitute_name":  ing.name,
            "similarity_score": sub.similarity_score,
            "reason":           sub.reason,
            "vegan_safe":       sub.vegan_safe,
            "gluten_free_safe": sub.gluten_free_safe,
            "cost_ratio":       sub.cost_ratio,
        }
        for sub, ing in rows
    ]
