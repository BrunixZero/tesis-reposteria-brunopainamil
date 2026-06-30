-- ============================================================
--  Sistema de Gestión de Recetas y Presupuestos — Repostería
--  Tesis: Bruno Painamil | Universidad Andrés Bello 2026
--  Base de datos: PostgreSQL 15+
--  Ejecutar: psql -U postgres -d reposteria_db -f schema.sql
-- ============================================================

-- Extensión para UUIDs automáticos
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- ============================================================
-- 1. USERS — Usuarios del sistema (emprendedores/reposteros)
-- ============================================================
CREATE TABLE users (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name          VARCHAR(120)        NOT NULL,
    email         VARCHAR(255)        NOT NULL UNIQUE,
    password_hash VARCHAR(255)        NOT NULL,
    created_at    TIMESTAMP           NOT NULL DEFAULT NOW()
);

-- ============================================================
-- 2. INGREDIENTS — Catálogo maestro de ingredientes
--    Incluye propiedades para el modelo KNN de sustitutos
-- ============================================================
CREATE TABLE ingredients (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name            VARCHAR(120)   NOT NULL UNIQUE,
    default_unit    VARCHAR(30)    NOT NULL,          -- 'g', 'ml', 'unidad', 'taza'
    -- Propiedades culinarias (escala 0-10) usadas por el modelo KNN
    binding_power   FLOAT          NOT NULL DEFAULT 0, -- poder aglutinante
    moisture        FLOAT          NOT NULL DEFAULT 0, -- aporte de humedad
    fat_content     FLOAT          NOT NULL DEFAULT 0, -- contenido graso
    sweetness       FLOAT          NOT NULL DEFAULT 0, -- dulzor
    leavening       FLOAT          NOT NULL DEFAULT 0, -- agente leudante
    -- Restricciones alimentarias
    is_vegan        BOOLEAN        NOT NULL DEFAULT FALSE,
    is_gluten_free  BOOLEAN        NOT NULL DEFAULT FALSE,
    -- Precio base para cálculo de presupuestos
    price_per_unit  FLOAT          NOT NULL DEFAULT 0, -- precio en CLP por unidad default
    unit_label      VARCHAR(30)    NOT NULL DEFAULT 'unidad',
    created_at      TIMESTAMP      NOT NULL DEFAULT NOW()
);

COMMENT ON COLUMN ingredients.binding_power IS 'Escala 0-10: cuánto ayuda a unir la mezcla (ej: huevo=9)';
COMMENT ON COLUMN ingredients.moisture      IS 'Escala 0-10: cuánta humedad aporta al producto';
COMMENT ON COLUMN ingredients.fat_content   IS 'Escala 0-10: contenido de grasa (ej: mantequilla=10)';
COMMENT ON COLUMN ingredients.sweetness     IS 'Escala 0-10: nivel de dulzor';
COMMENT ON COLUMN ingredients.leavening     IS 'Escala 0-10: capacidad leudante (ej: polvo hornear=10)';

-- ============================================================
-- 3. RECIPES — Recetas creadas por los usuarios
-- ============================================================
CREATE TABLE recipes (
    id             UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id        UUID           NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    name           VARCHAR(200)   NOT NULL,
    description    TEXT,
    category       VARCHAR(80),   -- 'torta', 'galleta', 'pan', 'muffin', etc.
    base_servings  INT            NOT NULL DEFAULT 1 CHECK (base_servings > 0),
    prep_time_min  INT            DEFAULT 0,
    cook_time_min  INT            DEFAULT 0,
    instructions   TEXT,
    is_public      BOOLEAN        NOT NULL DEFAULT FALSE,
    created_at     TIMESTAMP      NOT NULL DEFAULT NOW(),
    updated_at     TIMESTAMP      NOT NULL DEFAULT NOW()
);

-- ============================================================
-- 4. RECIPE_INGREDIENTS — Relación N:N entre receta e ingredientes
--    Es la tabla que permite el escalado automático de porciones
-- ============================================================
CREATE TABLE recipe_ingredients (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    recipe_id       UUID         NOT NULL REFERENCES recipes(id) ON DELETE CASCADE,
    ingredient_id   UUID         NOT NULL REFERENCES ingredients(id),
    quantity        FLOAT        NOT NULL CHECK (quantity > 0), -- cantidad para base_servings
    unit            VARCHAR(30)  NOT NULL,                       -- unidad específica en esta receta
    notes           VARCHAR(255),                                -- ej: "tamizado", "a temperatura ambiente"
    UNIQUE (recipe_id, ingredient_id)
);

COMMENT ON COLUMN recipe_ingredients.quantity IS 'Cantidad para el número de porciones base de la receta';

-- ============================================================
-- 5. SUBSTITUTES — Tabla de sustitutos generada por el modelo KNN
--    Se llena offline desde el notebook de Colab y se importa aquí
-- ============================================================
CREATE TABLE substitutes (
    id                UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    original_id       UUID    NOT NULL REFERENCES ingredients(id),
    substitute_id     UUID    NOT NULL REFERENCES ingredients(id),
    similarity_score  FLOAT   NOT NULL CHECK (similarity_score BETWEEN 0 AND 1),
    reason            VARCHAR(300),  -- explicación legible: "similar poder aglutinante y humedad"
    vegan_safe        BOOLEAN NOT NULL DEFAULT FALSE,
    gluten_free_safe  BOOLEAN NOT NULL DEFAULT FALSE,
    cost_ratio        FLOAT   NOT NULL DEFAULT 1.0, -- sustituto_precio / original_precio
    UNIQUE (original_id, substitute_id),
    CHECK (original_id <> substitute_id)
);

COMMENT ON COLUMN substitutes.similarity_score IS 'Score KNN: 1.0 = idéntico, 0.0 = sin similitud';
COMMENT ON COLUMN substitutes.cost_ratio        IS 'Ratio de precio: <1 más barato, >1 más caro';

-- ============================================================
-- 6. QUOTES — Cotizaciones / presupuestos para pedidos
-- ============================================================
CREATE TABLE quotes (
    id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id             UUID           NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    recipe_id           UUID           NOT NULL REFERENCES recipes(id),
    client_name         VARCHAR(150),
    client_email        VARCHAR(255),
    servings_requested  INT            NOT NULL CHECK (servings_requested > 0),
    ingredient_cost     FLOAT          NOT NULL DEFAULT 0,  -- costo total insumos (CLP)
    overhead_pct        FLOAT          NOT NULL DEFAULT 20, -- % gastos indirectos (luz, gas, etc.)
    margin_pct          FLOAT          NOT NULL DEFAULT 30, -- % margen de ganancia deseado
    final_price         FLOAT          NOT NULL DEFAULT 0,  -- precio final sugerido al cliente
    status              VARCHAR(30)    NOT NULL DEFAULT 'draft'
                                       CHECK (status IN ('draft','sent','accepted','rejected')),
    notes               TEXT,
    created_at          TIMESTAMP      NOT NULL DEFAULT NOW()
);

COMMENT ON COLUMN quotes.overhead_pct  IS 'Porcentaje para cubrir costos indirectos (luz, gas, tiempo)';
COMMENT ON COLUMN quotes.margin_pct    IS 'Porcentaje de ganancia sobre el costo total';
COMMENT ON COLUMN quotes.final_price   IS 'ingredient_cost * (1 + overhead_pct/100) * (1 + margin_pct/100)';

-- ============================================================
-- 7. QUOTE_ITEMS — Detalle de ingredientes en cada cotización
--    Se genera al escalar la receta a las porciones solicitadas
-- ============================================================
CREATE TABLE quote_items (
    id               UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    quote_id         UUID    NOT NULL REFERENCES quotes(id) ON DELETE CASCADE,
    ingredient_id    UUID    NOT NULL REFERENCES ingredients(id),
    quantity_needed  FLOAT   NOT NULL,  -- cantidad escalada a servings_requested
    unit             VARCHAR(30) NOT NULL,
    unit_cost        FLOAT   NOT NULL,  -- precio por unidad al momento de la cotización
    subtotal         FLOAT   NOT NULL   -- quantity_needed * unit_cost
);

-- ============================================================
-- 8. UNIT_CONVERSIONS — Tabla de conversiones de unidades
--    Permite escalar entre tazas, gramos, ml, cucharadas, etc.
-- ============================================================
CREATE TABLE unit_conversions (
    id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    from_unit  VARCHAR(30) NOT NULL,
    to_unit    VARCHAR(30) NOT NULL,
    factor     FLOAT       NOT NULL CHECK (factor > 0),
    UNIQUE (from_unit, to_unit)
);

COMMENT ON COLUMN unit_conversions.factor IS 'Multiplicar from_unit × factor = to_unit. Ej: taza → ml = 240';

-- ============================================================
-- ÍNDICES — Aceleran las consultas más frecuentes
-- ============================================================
CREATE INDEX idx_recipes_user       ON recipes(user_id);
CREATE INDEX idx_recipe_ing_recipe  ON recipe_ingredients(recipe_id);
CREATE INDEX idx_recipe_ing_ing     ON recipe_ingredients(ingredient_id);
CREATE INDEX idx_substitutes_orig   ON substitutes(original_id);
CREATE INDEX idx_substitutes_score  ON substitutes(similarity_score DESC);
CREATE INDEX idx_quotes_user        ON quotes(user_id);
CREATE INDEX idx_quotes_recipe      ON quotes(recipe_id);
CREATE INDEX idx_quote_items_quote  ON quote_items(quote_id);

-- ============================================================
-- DATOS SEMILLA — Conversiones de unidades comunes
-- ============================================================
INSERT INTO unit_conversions (from_unit, to_unit, factor) VALUES
    ('taza',         'ml',    240),
    ('ml',           'taza',  0.00417),
    ('taza',         'g',     200),   -- aproximación para harina
    ('cucharada',    'ml',    15),
    ('cucharadita',  'ml',    5),
    ('cucharada',    'g',     12),
    ('cucharadita',  'g',     4),
    ('oz',           'g',     28.35),
    ('lb',           'g',     453.59),
    ('kg',           'g',     1000),
    ('g',            'kg',    0.001),
    ('l',            'ml',    1000),
    ('ml',           'l',     0.001);

-- ============================================================
-- DATOS SEMILLA — Ingredientes base con propiedades KNN
--   (binding_power, moisture, fat_content, sweetness, leavening)
-- ============================================================
INSERT INTO ingredients
    (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening,
     is_vegan, is_gluten_free, price_per_unit, unit_label)
VALUES
    ('huevo',              'unidad', 9, 7, 5, 0, 1, FALSE, TRUE,  350,   'unidad'),
    ('harina',             'g',      2, 1, 0, 0, 0, TRUE,  FALSE, 0.9,   'g'),
    ('mantequilla',        'g',      1, 2, 10,0, 0, FALSE, TRUE,  12,    'g'),
    ('azúcar',             'g',      0, 0, 0, 10,0, TRUE,  TRUE,  1.2,   'g'),
    ('azúcar flor',        'g',      0, 0, 0, 10,0, TRUE,  TRUE,  1.8,   'g'),
    ('azúcar morena',      'g',      1, 2, 0, 9, 0, TRUE,  TRUE,  2.0,   'g'),
    ('leche',              'ml',     2, 9, 3, 2, 0, FALSE, TRUE,  1.1,   'ml'),
    ('leche vegetal',      'ml',     1, 9, 1, 1, 0, TRUE,  TRUE,  2.5,   'ml'),
    ('crema',              'ml',     1, 6, 8, 1, 0, FALSE, TRUE,  6,     'ml'),
    ('aceite vegetal',     'ml',     0, 2, 10,0, 0, TRUE,  TRUE,  4,     'ml'),
    ('polvo de hornear',   'g',      0, 0, 0, 0, 10,TRUE,  TRUE,  8,     'g'),
    ('bicarbonato',        'g',      0, 0, 0, 0, 8, TRUE,  TRUE,  5,     'g'),
    ('vainilla',           'ml',     0, 1, 0, 1, 0, TRUE,  TRUE,  25,    'ml'),
    ('cacao en polvo',     'g',      1, 0, 3, 3, 0, TRUE,  TRUE,  15,    'g'),
    ('chocolate cobertura','g',      1, 0, 6, 8, 0, TRUE,  TRUE,  18,    'g'),
    ('plátano maduro',     'g',      7, 8, 0, 5, 0, TRUE,  TRUE,  2,     'g'),
    ('puré de manzana',    'g',      6, 8, 0, 4, 0, TRUE,  TRUE,  3,     'g'),
    ('gel de linaza',      'g',      8, 6, 3, 0, 0, TRUE,  TRUE,  6,     'g'),
    ('queso crema',        'g',      3, 4, 8, 1, 0, FALSE, TRUE,  20,    'g'),
    ('sal',                'g',      0, 0, 0, 0, 0, TRUE,  TRUE,  0.5,   'g');

-- ============================================================
-- DATOS SEMILLA — Sustitutos base (se ampliarán con el modelo KNN)
-- ============================================================
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT
    o.id, s.id,
    0.85,
    'Similar poder aglutinante y aporte de humedad',
    TRUE, TRUE,
    ROUND((s.price_per_unit / NULLIF(o.price_per_unit, 0))::numeric, 2)
FROM ingredients o, ingredients s
WHERE o.name = 'huevo' AND s.name = 'gel de linaza';

INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT
    o.id, s.id,
    0.80,
    'Alto poder aglutinante y humedad, sabor neutro',
    TRUE, TRUE,
    ROUND((s.price_per_unit / NULLIF(o.price_per_unit, 0))::numeric, 2)
FROM ingredients o, ingredients s
WHERE o.name = 'huevo' AND s.name = 'plátano maduro';

INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT
    o.id, s.id,
    0.78,
    'Aporta humedad y dulzor natural similar al huevo en bizcochos',
    TRUE, TRUE,
    ROUND((s.price_per_unit / NULLIF(o.price_per_unit, 0))::numeric, 2)
FROM ingredients o, ingredients s
WHERE o.name = 'huevo' AND s.name = 'puré de manzana';

INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT
    o.id, s.id,
    0.90,
    'Misma función grasa y textura en masas horneadas',
    TRUE, TRUE,
    ROUND((s.price_per_unit / NULLIF(o.price_per_unit, 0))::numeric, 2)
FROM ingredients o, ingredients s
WHERE o.name = 'mantequilla' AND s.name = 'aceite vegetal';

INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT
    o.id, s.id,
    0.88,
    'Perfil nutricional y de dulzor muy similar',
    TRUE, TRUE,
    ROUND((s.price_per_unit / NULLIF(o.price_per_unit, 0))::numeric, 2)
FROM ingredients o, ingredients s
WHERE o.name = 'azúcar' AND s.name = 'azúcar morena';

INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT
    o.id, s.id,
    0.82,
    'Reemplaza leche de vaca, misma función de humedad',
    TRUE, TRUE,
    ROUND((s.price_per_unit / NULLIF(o.price_per_unit, 0))::numeric, 2)
FROM ingredients o, ingredients s
WHERE o.name = 'leche' AND s.name = 'leche vegetal';

INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT
    o.id, s.id,
    0.75,
    'Mismo efecto leudante, intercambiables con ajuste de cantidad',
    TRUE, TRUE,
    ROUND((s.price_per_unit / NULLIF(o.price_per_unit, 0))::numeric, 2)
FROM ingredients o, ingredients s
WHERE o.name = 'polvo de hornear' AND s.name = 'bicarbonato';

-- ============================================================
-- VISTA ÚTIL: cotización con margen calculado
-- ============================================================
CREATE OR REPLACE VIEW v_quote_summary AS
SELECT
    q.id,
    q.client_name,
    r.name                                           AS recipe_name,
    q.servings_requested,
    q.ingredient_cost,
    q.overhead_pct,
    q.margin_pct,
    ROUND(
        (q.ingredient_cost * (1 + q.overhead_pct / 100.0) * (1 + q.margin_pct / 100.0))::numeric,
        0
    )                                                AS suggested_price,
    q.status,
    q.created_at
FROM quotes q
JOIN recipes r ON r.id = q.recipe_id;

-- ============================================================
-- VISTA ÚTIL: top sustitutos por ingrediente
-- ============================================================
CREATE OR REPLACE VIEW v_top_substitutes AS
SELECT
    i_orig.name                        AS original_ingredient,
    i_sub.name                         AS substitute,
    s.similarity_score,
    s.reason,
    s.vegan_safe,
    s.gluten_free_safe,
    s.cost_ratio,
    CASE
        WHEN s.cost_ratio < 1 THEN 'más barato'
        WHEN s.cost_ratio > 1 THEN 'más caro'
        ELSE 'precio similar'
    END                                AS cost_comparison
FROM substitutes s
JOIN ingredients i_orig ON i_orig.id = s.original_id
JOIN ingredients i_sub  ON i_sub.id  = s.substitute_id
ORDER BY i_orig.name, s.similarity_score DESC;
