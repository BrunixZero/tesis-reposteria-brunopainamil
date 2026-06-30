from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
from sqlalchemy.orm import selectinload
from app.config import get_db
from app.models import Quote, QuoteItem, Ingredient, Recipe, User
from app.schemas import QuoteCreate, QuoteOut, QuoteStatusUpdate
from app.services.auth import get_current_user
from app.services.recipe_service import calculate_quote
import uuid

router = APIRouter(prefix="/quotes", tags=["Cotizaciones"])


def _build_quote_out(q: Quote, recipe_name: str) -> dict:
    return {
        "id":                 q.id,
        "recipe_id":          q.recipe_id,
        "recipe_name":        recipe_name,
        "client_name":        q.client_name,
        "client_email":       q.client_email,
        "servings_requested": q.servings_requested,
        "ingredient_cost":    q.ingredient_cost,
        "overhead_pct":       q.overhead_pct,
        "margin_pct":         q.margin_pct,
        "final_price":        q.final_price,
        "status":             q.status,
        "notes":              q.notes,
        "created_at":         q.created_at,
        "items": [
            {
                "ingredient_id":   item.ingredient_id,
                "ingredient_name": item.ingredient.name,
                "quantity_needed": item.quantity_needed,
                "unit":            item.unit,
                "unit_cost":       item.unit_cost,
                "subtotal":        item.subtotal,
            }
            for item in q.items
        ],
    }


@router.post("", status_code=201)
async def create_quote(
    data: QuoteCreate,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    """
    Genera una cotización automática escalando la receta y calculando precio con margen.
    """
    quote = await calculate_quote(data, current_user.id, db)
    if not quote:
        raise HTTPException(404, "Receta no encontrada")

    result = await db.execute(
        select(Quote)
        .options(selectinload(Quote.items).selectinload(QuoteItem.ingredient))
        .where(Quote.id == quote.id)
    )
    q = result.scalar_one()

    recipe_result = await db.execute(select(Recipe).where(Recipe.id == q.recipe_id))
    recipe = recipe_result.scalar_one()

    return _build_quote_out(q, recipe.name)


@router.get("")
async def list_quotes(
    status: str | None = Query(default=None),
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    query = (
        select(Quote)
        .options(selectinload(Quote.items).selectinload(QuoteItem.ingredient))
        .where(Quote.user_id == current_user.id)
        .order_by(Quote.created_at.desc())
    )
    if status:
        query = query.where(Quote.status == status)

    result = await db.execute(query)
    quotes = result.scalars().all()

    out = []
    for q in quotes:
        recipe_result = await db.execute(select(Recipe).where(Recipe.id == q.recipe_id))
        recipe = recipe_result.scalar_one()
        out.append(_build_quote_out(q, recipe.name))
    return out


@router.get("/{quote_id}")
async def get_quote(
    quote_id: uuid.UUID,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    result = await db.execute(
        select(Quote)
        .options(selectinload(Quote.items).selectinload(QuoteItem.ingredient))
        .where(Quote.id == quote_id, Quote.user_id == current_user.id)
    )
    q = result.scalar_one_or_none()
    if not q:
        raise HTTPException(404, "Cotización no encontrada")

    recipe_result = await db.execute(select(Recipe).where(Recipe.id == q.recipe_id))
    recipe = recipe_result.scalar_one()
    return _build_quote_out(q, recipe.name)


@router.patch("/{quote_id}/status")
async def update_status(
    quote_id: uuid.UUID,
    data: QuoteStatusUpdate,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    valid = {"draft", "sent", "accepted", "rejected"}
    if data.status not in valid:
        raise HTTPException(400, f"Estado inválido. Opciones: {valid}")

    result = await db.execute(
        select(Quote).where(Quote.id == quote_id, Quote.user_id == current_user.id)
    )
    q = result.scalar_one_or_none()
    if not q:
        raise HTTPException(404, "Cotización no encontrada")

    q.status = data.status
    await db.commit()
    return {"id": str(quote_id), "status": q.status}


@router.delete("/{quote_id}", status_code=204)
async def delete_quote(
    quote_id: uuid.UUID,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    result = await db.execute(
        select(Quote).where(Quote.id == quote_id, Quote.user_id == current_user.id)
    )
    q = result.scalar_one_or_none()
    if not q:
        raise HTTPException(404, "Cotización no encontrada")
    await db.delete(q)
    await db.commit()
