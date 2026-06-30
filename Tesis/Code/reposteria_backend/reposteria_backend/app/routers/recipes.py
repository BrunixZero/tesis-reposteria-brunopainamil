from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
from sqlalchemy.orm import selectinload
from app.config import get_db
from app.models import Recipe, RecipeIngredient, Ingredient, User
from app.schemas import RecipeCreate, RecipeOut, RecipeIngredientOut
from app.services.auth import get_current_user
from app.services.recipe_service import scale_recipe
import uuid
from datetime import datetime

router = APIRouter(prefix="/recipes", tags=["Recetas"])


def _build_recipe_out(recipe: Recipe) -> dict:
    return {
        "id":            recipe.id,
        "name":          recipe.name,
        "description":   recipe.description,
        "category":      recipe.category,
        "base_servings": recipe.base_servings,
        "prep_time_min": recipe.prep_time_min,
        "cook_time_min": recipe.cook_time_min,
        "instructions":  recipe.instructions,
        "is_public":     recipe.is_public,
        "created_at":    recipe.created_at,
        "ingredients": [
            {
                "id":              ri.id,
                "ingredient_id":   ri.ingredient_id,
                "ingredient_name": ri.ingredient.name,
                "quantity":        ri.quantity,
                "unit":            ri.unit,
                "notes":           ri.notes,
            }
            for ri in recipe.ingredients
        ],
    }


@router.get("", response_model=list[RecipeOut])
async def list_recipes(
    category: str | None = Query(default=None),
    search: str = Query(default=""),
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    query = (
        select(Recipe)
        .options(selectinload(Recipe.ingredients).selectinload(RecipeIngredient.ingredient))
        .where(Recipe.user_id == current_user.id)
        .order_by(Recipe.created_at.desc())
    )
    if category:
        query = query.where(Recipe.category == category)
    if search:
        query = query.where(Recipe.name.ilike(f"%{search}%"))

    result = await db.execute(query)
    recipes = result.scalars().all()
    return [_build_recipe_out(r) for r in recipes]


@router.get("/{recipe_id}", response_model=RecipeOut)
async def get_recipe(
    recipe_id: uuid.UUID,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    result = await db.execute(
        select(Recipe)
        .options(selectinload(Recipe.ingredients).selectinload(RecipeIngredient.ingredient))
        .where(Recipe.id == recipe_id, Recipe.user_id == current_user.id)
    )
    recipe = result.scalar_one_or_none()
    if not recipe:
        raise HTTPException(404, "Receta no encontrada")
    return _build_recipe_out(recipe)


@router.post("", response_model=RecipeOut, status_code=201)
async def create_recipe(
    data: RecipeCreate,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    recipe = Recipe(
        user_id=current_user.id,
        name=data.name,
        description=data.description,
        category=data.category,
        base_servings=data.base_servings,
        prep_time_min=data.prep_time_min,
        cook_time_min=data.cook_time_min,
        instructions=data.instructions,
        is_public=data.is_public,
    )
    db.add(recipe)
    await db.flush()

    for ing_data in data.ingredients:
        ri = RecipeIngredient(
            recipe_id=recipe.id,
            ingredient_id=ing_data.ingredient_id,
            quantity=ing_data.quantity,
            unit=ing_data.unit,
            notes=ing_data.notes,
        )
        db.add(ri)

    await db.commit()

    result = await db.execute(
        select(Recipe)
        .options(selectinload(Recipe.ingredients).selectinload(RecipeIngredient.ingredient))
        .where(Recipe.id == recipe.id)
    )
    return _build_recipe_out(result.scalar_one())


@router.put("/{recipe_id}", response_model=RecipeOut)
async def update_recipe(
    recipe_id: uuid.UUID,
    data: RecipeCreate,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    result = await db.execute(
        select(Recipe)
        .options(selectinload(Recipe.ingredients))
        .where(Recipe.id == recipe_id, Recipe.user_id == current_user.id)
    )
    recipe = result.scalar_one_or_none()
    if not recipe:
        raise HTTPException(404, "Receta no encontrada")

    recipe.name = data.name
    recipe.description = data.description
    recipe.category = data.category
    recipe.base_servings = data.base_servings
    recipe.prep_time_min = data.prep_time_min
    recipe.cook_time_min = data.cook_time_min
    recipe.instructions = data.instructions
    recipe.is_public = data.is_public
    recipe.updated_at = datetime.utcnow()

    for ri in recipe.ingredients:
        await db.delete(ri)
    await db.flush()

    for ing_data in data.ingredients:
        ri = RecipeIngredient(
            recipe_id=recipe.id,
            ingredient_id=ing_data.ingredient_id,
            quantity=ing_data.quantity,
            unit=ing_data.unit,
            notes=ing_data.notes,
        )
        db.add(ri)

    await db.commit()

    result = await db.execute(
        select(Recipe)
        .options(selectinload(Recipe.ingredients).selectinload(RecipeIngredient.ingredient))
        .where(Recipe.id == recipe.id)
    )
    return _build_recipe_out(result.scalar_one())


@router.delete("/{recipe_id}", status_code=204)
async def delete_recipe(
    recipe_id: uuid.UUID,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    result = await db.execute(
        select(Recipe).where(Recipe.id == recipe_id, Recipe.user_id == current_user.id)
    )
    recipe = result.scalar_one_or_none()
    if not recipe:
        raise HTTPException(404, "Receta no encontrada")
    await db.delete(recipe)
    await db.commit()


@router.get("/{recipe_id}/scale")
async def scale(
    recipe_id: uuid.UUID,
    servings: int = Query(gt=0, description="Número de porciones deseadas"),
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    """
    Escala automáticamente los ingredientes de una receta a las porciones solicitadas.
    También devuelve el costo estimado de ingredientes.
    """
    scaled = await scale_recipe(recipe_id, servings, db)
    if not scaled:
        raise HTTPException(404, "Receta no encontrada")
    return scaled
