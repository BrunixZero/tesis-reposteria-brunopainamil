import uuid
from datetime import datetime
from sqlalchemy import (
    String, Float, Boolean, Integer, Text,
    ForeignKey, DateTime, CheckConstraint, UniqueConstraint
)
from sqlalchemy.orm import Mapped, mapped_column, relationship
from sqlalchemy.dialects.postgresql import UUID
from app.config import Base


class User(Base):
    __tablename__ = "users"

    id:            Mapped[uuid.UUID]  = mapped_column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    name:          Mapped[str]        = mapped_column(String(120), nullable=False)
    email:         Mapped[str]        = mapped_column(String(255), nullable=False, unique=True)
    password_hash: Mapped[str]        = mapped_column(String(255), nullable=False)
    created_at:    Mapped[datetime]   = mapped_column(DateTime, default=datetime.utcnow)

    recipes: Mapped[list["Recipe"]] = relationship(back_populates="user")
    quotes:  Mapped[list["Quote"]]  = relationship(back_populates="user")


class Ingredient(Base):
    __tablename__ = "ingredients"

    id:             Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    name:           Mapped[str]       = mapped_column(String(120), nullable=False, unique=True)
    default_unit:   Mapped[str]       = mapped_column(String(30), nullable=False)
    binding_power:  Mapped[float]     = mapped_column(Float, default=0)
    moisture:       Mapped[float]     = mapped_column(Float, default=0)
    fat_content:    Mapped[float]     = mapped_column(Float, default=0)
    sweetness:      Mapped[float]     = mapped_column(Float, default=0)
    leavening:      Mapped[float]     = mapped_column(Float, default=0)
    is_vegan:       Mapped[bool]      = mapped_column(Boolean, default=False)
    is_gluten_free: Mapped[bool]      = mapped_column(Boolean, default=False)
    price_per_unit: Mapped[float]     = mapped_column(Float, default=0)
    unit_label:     Mapped[str]       = mapped_column(String(30), default="unidad")
    created_at:     Mapped[datetime]  = mapped_column(DateTime, default=datetime.utcnow)

    substitutes_as_original:    Mapped[list["Substitute"]] = relationship(foreign_keys="Substitute.original_id",    back_populates="original")
    substitutes_as_replacement: Mapped[list["Substitute"]] = relationship(foreign_keys="Substitute.substitute_id", back_populates="substitute")
    recipe_usages: Mapped[list["RecipeIngredient"]] = relationship(back_populates="ingredient")


class Recipe(Base):
    __tablename__ = "recipes"

    id:            Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id:       Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="CASCADE"))
    name:          Mapped[str]       = mapped_column(String(200), nullable=False)
    description:   Mapped[str|None]  = mapped_column(Text)
    category:      Mapped[str|None]  = mapped_column(String(80))
    base_servings: Mapped[int]       = mapped_column(Integer, default=1)
    prep_time_min: Mapped[int]       = mapped_column(Integer, default=0)
    cook_time_min: Mapped[int]       = mapped_column(Integer, default=0)
    instructions:  Mapped[str|None]  = mapped_column(Text)
    is_public:     Mapped[bool]      = mapped_column(Boolean, default=False)
    created_at:    Mapped[datetime]  = mapped_column(DateTime, default=datetime.utcnow)
    updated_at:    Mapped[datetime]  = mapped_column(DateTime, default=datetime.utcnow)

    user:        Mapped["User"]                    = relationship(back_populates="recipes")
    ingredients: Mapped[list["RecipeIngredient"]]  = relationship(back_populates="recipe", cascade="all, delete-orphan")
    quotes:      Mapped[list["Quote"]]             = relationship(back_populates="recipe")


class RecipeIngredient(Base):
    __tablename__ = "recipe_ingredients"
    __table_args__ = (UniqueConstraint("recipe_id", "ingredient_id"),)

    id:            Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    recipe_id:     Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), ForeignKey("recipes.id", ondelete="CASCADE"))
    ingredient_id: Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), ForeignKey("ingredients.id"))
    quantity:      Mapped[float]     = mapped_column(Float, nullable=False)
    unit:          Mapped[str]       = mapped_column(String(30), nullable=False)
    notes:         Mapped[str|None]  = mapped_column(String(255))

    recipe:     Mapped["Recipe"]     = relationship(back_populates="ingredients")
    ingredient: Mapped["Ingredient"] = relationship(back_populates="recipe_usages")


class Substitute(Base):
    __tablename__ = "substitutes"
    __table_args__ = (UniqueConstraint("original_id", "substitute_id"),)

    id:               Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    original_id:      Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), ForeignKey("ingredients.id"))
    substitute_id:    Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), ForeignKey("ingredients.id"))
    similarity_score: Mapped[float]     = mapped_column(Float, nullable=False)
    reason:           Mapped[str|None]  = mapped_column(String(300))
    vegan_safe:       Mapped[bool]      = mapped_column(Boolean, default=False)
    gluten_free_safe: Mapped[bool]      = mapped_column(Boolean, default=False)
    cost_ratio:       Mapped[float]     = mapped_column(Float, default=1.0)

    original:   Mapped["Ingredient"] = relationship(foreign_keys=[original_id],   back_populates="substitutes_as_original")
    substitute: Mapped["Ingredient"] = relationship(foreign_keys=[substitute_id], back_populates="substitutes_as_replacement")


class Quote(Base):
    __tablename__ = "quotes"

    id:                 Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    user_id:            Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), ForeignKey("users.id", ondelete="CASCADE"))
    recipe_id:          Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), ForeignKey("recipes.id"))
    client_name:        Mapped[str|None]  = mapped_column(String(150))
    client_email:       Mapped[str|None]  = mapped_column(String(255))
    servings_requested: Mapped[int]       = mapped_column(Integer, nullable=False)
    ingredient_cost:    Mapped[float]     = mapped_column(Float, default=0)
    overhead_pct:       Mapped[float]     = mapped_column(Float, default=20)
    margin_pct:         Mapped[float]     = mapped_column(Float, default=30)
    final_price:        Mapped[float]     = mapped_column(Float, default=0)
    status:             Mapped[str]       = mapped_column(String(30), default="draft")
    notes:              Mapped[str|None]  = mapped_column(Text)
    created_at:         Mapped[datetime]  = mapped_column(DateTime, default=datetime.utcnow)

    user:   Mapped["User"]            = relationship(back_populates="quotes")
    recipe: Mapped["Recipe"]          = relationship(back_populates="quotes")
    items:  Mapped[list["QuoteItem"]] = relationship(back_populates="quote", cascade="all, delete-orphan")


class QuoteItem(Base):
    __tablename__ = "quote_items"

    id:              Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    quote_id:        Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), ForeignKey("quotes.id", ondelete="CASCADE"))
    ingredient_id:   Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), ForeignKey("ingredients.id"))
    quantity_needed: Mapped[float]     = mapped_column(Float, nullable=False)
    unit:            Mapped[str]       = mapped_column(String(30), nullable=False)
    unit_cost:       Mapped[float]     = mapped_column(Float, nullable=False)
    subtotal:        Mapped[float]     = mapped_column(Float, nullable=False)

    quote:      Mapped["Quote"]      = relationship(back_populates="items")
    ingredient: Mapped["Ingredient"] = relationship()


class UnitConversion(Base):
    __tablename__ = "unit_conversions"
    __table_args__ = (UniqueConstraint("from_unit", "to_unit"),)

    id:        Mapped[uuid.UUID] = mapped_column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    from_unit: Mapped[str]       = mapped_column(String(30), nullable=False)
    to_unit:   Mapped[str]       = mapped_column(String(30), nullable=False)
    factor:    Mapped[float]     = mapped_column(Float, nullable=False)
