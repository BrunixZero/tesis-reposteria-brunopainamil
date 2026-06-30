import uuid
from datetime import datetime
from pydantic import BaseModel, EmailStr


# ── Usuarios ────────────────────────────────────────────────
class UserCreate(BaseModel):
    name: str
    email: EmailStr
    password: str

class UserOut(BaseModel):
    id: uuid.UUID
    name: str
    email: str
    created_at: datetime
    model_config = {"from_attributes": True}

class Token(BaseModel):
    access_token: str
    token_type: str = "bearer"

class LoginRequest(BaseModel):
    email: EmailStr
    password: str


# ── Ingredientes ─────────────────────────────────────────────
class IngredientOut(BaseModel):
    id: uuid.UUID
    name: str
    default_unit: str
    binding_power: float
    moisture: float
    fat_content: float
    sweetness: float
    leavening: float
    is_vegan: bool
    is_gluten_free: bool
    price_per_unit: float
    unit_label: str
    model_config = {"from_attributes": True}

class IngredientCreate(BaseModel):
    name: str
    default_unit: str
    binding_power: float = 0
    moisture: float = 0
    fat_content: float = 0
    sweetness: float = 0
    leavening: float = 0
    is_vegan: bool = False
    is_gluten_free: bool = False
    price_per_unit: float = 0
    unit_label: str = "unidad"


# ── Sustitutos ───────────────────────────────────────────────
class SubstituteOut(BaseModel):
    substitute_id: uuid.UUID
    substitute_name: str
    similarity_score: float
    reason: str | None
    vegan_safe: bool
    gluten_free_safe: bool
    cost_ratio: float
    model_config = {"from_attributes": True}


# ── Recetas ──────────────────────────────────────────────────
class RecipeIngredientIn(BaseModel):
    ingredient_id: uuid.UUID
    quantity: float
    unit: str
    notes: str | None = None

class RecipeIngredientOut(BaseModel):
    id: uuid.UUID
    ingredient_id: uuid.UUID
    ingredient_name: str
    quantity: float
    unit: str
    notes: str | None
    model_config = {"from_attributes": True}

class RecipeCreate(BaseModel):
    name: str
    description: str | None = None
    category: str | None = None
    base_servings: int = 1
    prep_time_min: int = 0
    cook_time_min: int = 0
    instructions: str | None = None
    is_public: bool = False
    ingredients: list[RecipeIngredientIn] = []

class RecipeOut(BaseModel):
    id: uuid.UUID
    name: str
    description: str | None
    category: str | None
    base_servings: int
    prep_time_min: int
    cook_time_min: int
    instructions: str | None
    is_public: bool
    created_at: datetime
    ingredients: list[RecipeIngredientOut] = []
    model_config = {"from_attributes": True}

class RecipeScaled(BaseModel):
    recipe_id: uuid.UUID
    recipe_name: str
    original_servings: int
    requested_servings: int
    scale_factor: float
    ingredients: list[dict]  # [{name, quantity_scaled, unit, notes}]


# ── Cotizaciones ─────────────────────────────────────────────
class QuoteCreate(BaseModel):
    recipe_id: uuid.UUID
    client_name: str | None = None
    client_email: str | None = None
    servings_requested: int
    overhead_pct: float = 20
    margin_pct: float = 30
    notes: str | None = None

class QuoteItemOut(BaseModel):
    ingredient_id: uuid.UUID
    ingredient_name: str
    quantity_needed: float
    unit: str
    unit_cost: float
    subtotal: float
    model_config = {"from_attributes": True}

class QuoteOut(BaseModel):
    id: uuid.UUID
    recipe_id: uuid.UUID
    recipe_name: str
    client_name: str | None
    client_email: str | None
    servings_requested: int
    ingredient_cost: float
    overhead_pct: float
    margin_pct: float
    final_price: float
    status: str
    notes: str | None
    created_at: datetime
    items: list[QuoteItemOut] = []
    model_config = {"from_attributes": True}

class QuoteStatusUpdate(BaseModel):
    status: str  # draft | sent | accepted | rejected
