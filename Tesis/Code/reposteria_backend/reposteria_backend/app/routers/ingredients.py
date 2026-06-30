from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
from app.config import get_db
from app.models import Ingredient, User
from app.schemas import IngredientOut, IngredientCreate
from app.services.auth import get_current_user
from app.services.recipe_service import get_substitutes
import uuid

router = APIRouter(prefix="/ingredients", tags=["Ingredientes"])


@router.get("", response_model=list[IngredientOut])
async def list_ingredients(
    search: str = Query(default="", description="Filtrar por nombre"),
    is_vegan: bool | None = Query(default=None),
    is_gluten_free: bool | None = Query(default=None),
    db: AsyncSession = Depends(get_db),
):
    query = select(Ingredient).order_by(Ingredient.name)
    if search:
        query = query.where(Ingredient.name.ilike(f"%{search}%"))
    if is_vegan is not None:
        query = query.where(Ingredient.is_vegan == is_vegan)
    if is_gluten_free is not None:
        query = query.where(Ingredient.is_gluten_free == is_gluten_free)

    result = await db.execute(query)
    return result.scalars().all()


@router.get("/{ingredient_id}", response_model=IngredientOut)
async def get_ingredient(ingredient_id: uuid.UUID, db: AsyncSession = Depends(get_db)):
    result = await db.execute(select(Ingredient).where(Ingredient.id == ingredient_id))
    ing = result.scalar_one_or_none()
    if not ing:
        raise HTTPException(404, "Ingrediente no encontrado")
    return ing


@router.get("/{ingredient_id}/substitutes")
async def substitutes(
    ingredient_id: uuid.UUID,
    vegan_only: bool = Query(default=False),
    gluten_free_only: bool = Query(default=False),
    db: AsyncSession = Depends(get_db),
):
    """
    Retorna los sustitutos recomendados por el modelo KNN para un ingrediente.
    Permite filtrar por restricciones alimentarias.
    """
    result = await db.execute(select(Ingredient).where(Ingredient.id == ingredient_id))
    ing = result.scalar_one_or_none()
    if not ing:
        raise HTTPException(404, "Ingrediente no encontrado")

    subs = await get_substitutes(ingredient_id, vegan_only, gluten_free_only, db)
    return {
        "ingredient_id":   str(ingredient_id),
        "ingredient_name": ing.name,
        "substitutes":     subs,
    }


@router.post("", response_model=IngredientOut, status_code=201)
async def create_ingredient(
    data: IngredientCreate,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    ing = Ingredient(**data.model_dump())
    db.add(ing)
    await db.commit()
    await db.refresh(ing)
    return ing


@router.put("/{ingredient_id}", response_model=IngredientOut)
async def update_ingredient(
    ingredient_id: uuid.UUID,
    data: IngredientCreate,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    result = await db.execute(select(Ingredient).where(Ingredient.id == ingredient_id))
    ing = result.scalar_one_or_none()
    if not ing:
        raise HTTPException(404, "Ingrediente no encontrado")

    for field, value in data.model_dump().items():
        setattr(ing, field, value)

    await db.commit()
    await db.refresh(ing)
    return ing
