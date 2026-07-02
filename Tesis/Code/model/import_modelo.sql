-- IMPORTACION MODELO KNN
-- Ejecutar: Get-Content import_modelo.sql | docker exec -i reposteria-db psql -U bruno -d reposteria_db

BEGIN;

-- 1. Limpiar sustitutos manuales
DELETE FROM substitutes;

-- 2. Insertar ingredientes nuevos
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'huevo', 'unidad', 9, 7, 5, 0, 1, FALSE, TRUE, 350.0, 'unidad'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'huevo');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'gel de linaza', 'g', 8, 6, 3, 0, 0, TRUE, TRUE, 6.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'gel de linaza');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'gel de chia', 'g', 8, 7, 2, 0, 0, TRUE, TRUE, 8.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'gel de chia');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'aquafaba', 'ml', 7, 8, 0, 0, 2, TRUE, TRUE, 2.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'aquafaba');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'pure de manzana', 'g', 6, 8, 0, 4, 0, TRUE, TRUE, 3.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'pure de manzana');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'platano maduro', 'g', 7, 8, 0, 5, 0, TRUE, TRUE, 2.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'platano maduro');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'yogur natural', 'g', 5, 7, 2, 1, 1, FALSE, TRUE, 4.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'yogur natural');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'yogur vegano', 'g', 4, 7, 1, 1, 1, TRUE, TRUE, 6.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'yogur vegano');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'tofu sedoso', 'g', 6, 6, 2, 0, 0, TRUE, TRUE, 5.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'tofu sedoso');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'queso crema', 'ml', 3, 4, 8, 1, 0, FALSE, TRUE, 20.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'queso crema');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'gelatina sin sabor', 'g', 7, 3, 0, 0, 0, FALSE, TRUE, 8.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'gelatina sin sabor');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'agar agar', 'g', 7, 3, 0, 0, 0, TRUE, TRUE, 12.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'agar agar');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'psyllium husk', 'g', 8, 5, 0, 0, 0, TRUE, TRUE, 18.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'psyllium husk');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'goma xantana', 'g', 9, 2, 0, 0, 0, TRUE, TRUE, 25.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'goma xantana');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'pure de zapallo', 'g', 5, 8, 0, 3, 0, TRUE, TRUE, 2.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'pure de zapallo');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'pure de remolacha', 'g', 4, 8, 0, 3, 0, TRUE, TRUE, 2.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'pure de remolacha');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'harina de trigo', 'g', 2, 1, 0, 0, 0, TRUE, FALSE, 0.9, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'harina de trigo');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'harina integral', 'g', 3, 2, 1, 0, 0, TRUE, FALSE, 1.2, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'harina integral');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'harina de almendra', 'g', 3, 3, 6, 1, 0, TRUE, TRUE, 18.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'harina de almendra');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'harina de avena', 'g', 2, 2, 1, 1, 0, TRUE, TRUE, 3.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'harina de avena');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'harina de arroz', 'g', 1, 1, 0, 0, 0, TRUE, TRUE, 2.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'harina de arroz');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'harina de coco', 'g', 4, 2, 4, 2, 0, TRUE, TRUE, 12.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'harina de coco');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'harina de maiz', 'g', 1, 1, 0, 1, 0, TRUE, TRUE, 1.5, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'harina de maiz');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'harina de garbanzo', 'g', 3, 2, 1, 1, 0, TRUE, TRUE, 4.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'harina de garbanzo');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'harina de quinoa', 'g', 3, 2, 2, 0, 0, TRUE, TRUE, 8.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'harina de quinoa');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'almidon de maiz', 'g', 3, 0, 0, 0, 0, TRUE, TRUE, 3.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'almidon de maiz');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'almidon de papa', 'g', 4, 0, 0, 0, 0, TRUE, TRUE, 4.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'almidon de papa');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'tapioca', 'g', 3, 1, 0, 0, 0, TRUE, TRUE, 5.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'tapioca');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'semola', 'g', 2, 1, 0, 0, 0, TRUE, FALSE, 1.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'semola');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'mantequilla', 'g', 1, 2, 10, 0, 0, FALSE, TRUE, 12.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'mantequilla');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'margarina vegana', 'g', 1, 2, 9, 0, 0, TRUE, TRUE, 8.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'margarina vegana');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'aceite vegetal', 'ml', 0, 2, 10, 0, 0, TRUE, TRUE, 4.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'aceite vegetal');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'aceite de coco', 'ml', 0, 1, 10, 1, 0, TRUE, TRUE, 9.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'aceite de coco');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'aceite de oliva', 'ml', 0, 2, 9, 0, 0, TRUE, TRUE, 8.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'aceite de oliva');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'manteca vegetal', 'g', 0, 1, 10, 0, 0, TRUE, TRUE, 6.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'manteca vegetal');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'crema', 'ml', 1, 6, 8, 1, 0, FALSE, TRUE, 6.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'crema');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'crema de coco', 'ml', 1, 5, 8, 2, 0, TRUE, TRUE, 7.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'crema de coco');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'aguacate', 'g', 2, 4, 7, 0, 0, TRUE, TRUE, 5.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'aguacate');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'mantequilla de mani', 'g', 3, 2, 8, 2, 0, TRUE, TRUE, 10.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'mantequilla de mani');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'aceite de girasol', 'ml', 0, 2, 10, 0, 0, TRUE, TRUE, 4.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'aceite de girasol');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'azucar blanca', 'g', 0, 0, 0, 10, 0, TRUE, TRUE, 1.2, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'azucar blanca');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'azucar morena', 'g', 1, 2, 0, 9, 0, TRUE, TRUE, 2.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'azucar morena');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'azucar flor', 'g', 0, 0, 0, 10, 0, TRUE, TRUE, 1.8, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'azucar flor');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'miel', 'g', 1, 3, 0, 9, 0, FALSE, TRUE, 12.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'miel');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'jarabe de maple', 'g', 1, 3, 0, 8, 0, TRUE, TRUE, 20.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'jarabe de maple');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'jarabe de agave', 'g', 0, 3, 0, 8, 0, TRUE, TRUE, 15.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'jarabe de agave');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'stevia', 'g', 0, 0, 0, 8, 0, TRUE, TRUE, 25.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'stevia');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'eritritol', 'g', 0, 0, 0, 7, 0, TRUE, TRUE, 18.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'eritritol');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'azucar de coco', 'g', 1, 1, 0, 7, 0, TRUE, TRUE, 14.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'azucar de coco');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'datiles molidos', 'g', 2, 3, 0, 8, 0, TRUE, TRUE, 10.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'datiles molidos');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'panela', 'g', 1, 2, 0, 9, 0, TRUE, TRUE, 4.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'panela');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'xilitol', 'g', 0, 0, 0, 7, 0, TRUE, TRUE, 20.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'xilitol');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'leche entera', 'ml', 2, 9, 3, 2, 0, FALSE, TRUE, 1.1, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'leche entera');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'leche descremada', 'ml', 1, 9, 1, 2, 0, FALSE, TRUE, 0.9, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'leche descremada');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'leche de almendra', 'ml', 1, 9, 1, 1, 0, TRUE, TRUE, 2.5, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'leche de almendra');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'leche de coco', 'ml', 1, 7, 5, 2, 0, TRUE, TRUE, 3.5, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'leche de coco');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'leche de avena', 'ml', 1, 9, 1, 2, 0, TRUE, TRUE, 2.8, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'leche de avena');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'leche de soya', 'ml', 2, 9, 2, 1, 0, TRUE, TRUE, 2.2, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'leche de soya');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'leche de arroz', 'ml', 0, 9, 0, 2, 0, TRUE, TRUE, 2.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'leche de arroz');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'buttermilk', 'ml', 3, 9, 2, 1, 3, FALSE, TRUE, 2.5, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'buttermilk');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'leche condensada', 'ml', 1, 5, 3, 10, 0, FALSE, TRUE, 8.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'leche condensada');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'leche de macadamia', 'ml', 1, 8, 2, 1, 0, TRUE, TRUE, 4.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'leche de macadamia');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'crema agria', 'ml', 2, 6, 5, 1, 1, FALSE, TRUE, 5.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'crema agria');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'polvo de hornear', 'g', 0, 0, 0, 0, 10, TRUE, TRUE, 8.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'polvo de hornear');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'bicarbonato de sodio', 'g', 0, 0, 0, 0, 8, TRUE, TRUE, 5.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'bicarbonato de sodio');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'levadura seca', 'g', 0, 0, 0, 0, 9, TRUE, TRUE, 10.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'levadura seca');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'levadura fresca', 'g', 0, 1, 0, 0, 10, TRUE, TRUE, 6.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'levadura fresca');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'cremor tartaro', 'g', 0, 0, 0, 0, 4, TRUE, TRUE, 15.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'cremor tartaro');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'vainilla extracto', 'ml', 0, 1, 0, 1, 0, TRUE, TRUE, 25.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'vainilla extracto');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'canela', 'g', 0, 0, 0, 2, 0, TRUE, TRUE, 10.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'canela');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'cacao en polvo', 'g', 1, 0, 3, 3, 0, TRUE, TRUE, 15.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'cacao en polvo');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'chocolate cobertura', 'g', 1, 0, 6, 8, 0, TRUE, TRUE, 18.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'chocolate cobertura');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'chocolate blanco', 'g', 0, 0, 7, 9, 0, FALSE, TRUE, 20.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'chocolate blanco');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'cacao amargo', 'g', 1, 0, 4, 1, 0, TRUE, TRUE, 22.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'cacao amargo');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'algarroba en polvo', 'g', 1, 0, 1, 4, 0, TRUE, TRUE, 12.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'algarroba en polvo');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'sal', 'g', 0, 0, 0, 0, 0, TRUE, TRUE, 0.5, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'sal');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'vinagre blanco', 'ml', 0, 2, 0, 0, 2, TRUE, TRUE, 2.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'vinagre blanco');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'jugo de limon', 'ml', 0, 3, 0, 1, 1, TRUE, TRUE, 3.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'jugo de limon');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'cafe soluble', 'g', 0, 2, 0, 0, 0, TRUE, TRUE, 20.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'cafe soluble');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'nueces molidas', 'g', 2, 1, 7, 0, 0, TRUE, TRUE, 15.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'nueces molidas');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'avena', 'g', 2, 3, 2, 1, 0, TRUE, TRUE, 2.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'avena');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'semillas de lino', 'g', 3, 2, 4, 0, 0, TRUE, TRUE, 6.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'semillas de lino');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'pure de calabaza', 'g', 5, 8, 0, 3, 0, TRUE, TRUE, 2.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'pure de calabaza');

-- 3. Insertar pares de sustitutos del modelo KNN
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9967, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de coco' AND s.name = 'manteca vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9927, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.44
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de coco' AND s.name = 'aceite vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9927, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.44
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de coco' AND s.name = 'aceite de girasol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.991, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.89
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de coco' AND s.name = 'aceite de oliva' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9871, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.89
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de coco' AND s.name = 'margarina vegana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de girasol' AND s.name = 'aceite de girasol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9991, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de girasol' AND s.name = 'aceite de oliva' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9965, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de girasol' AND s.name = 'manteca vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9955, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de girasol' AND s.name = 'margarina vegana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9944, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 3.0
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de girasol' AND s.name = 'mantequilla' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9991, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de oliva' AND s.name = 'aceite vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9991, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de oliva' AND s.name = 'aceite de girasol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9967, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.75
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de oliva' AND s.name = 'manteca vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9932, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de oliva' AND s.name = 'margarina vegana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.991, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.12
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de oliva' AND s.name = 'aceite de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'aceite vegetal' AND s.name = 'aceite de girasol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9991, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'aceite vegetal' AND s.name = 'aceite de oliva' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9965, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'aceite vegetal' AND s.name = 'manteca vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9955, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'aceite vegetal' AND s.name = 'margarina vegana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9944, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 3.0
FROM ingredients o, ingredients s
WHERE o.name = 'aceite vegetal' AND s.name = 'mantequilla' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'agar agar' AND s.name = 'agar agar' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9931, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.08
FROM ingredients o, ingredients s
WHERE o.name = 'agar agar' AND s.name = 'goma xantana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9822, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'agar agar' AND s.name = 'psyllium husk' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9226, 'Similar en: poder aglutinante, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'agar agar' AND s.name = 'gel de linaza' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9196, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'agar agar' AND s.name = 'gel de chia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9738, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 4.0
FROM ingredients o, ingredients s
WHERE o.name = 'aguacate' AND s.name = 'queso crema' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9639, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', FALSE, TRUE, 2.4
FROM ingredients o, ingredients s
WHERE o.name = 'aguacate' AND s.name = 'mantequilla' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9623, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.6
FROM ingredients o, ingredients s
WHERE o.name = 'aguacate' AND s.name = 'margarina vegana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9611, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.6
FROM ingredients o, ingredients s
WHERE o.name = 'aguacate' AND s.name = 'harina de almendra' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9555, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 1.2
FROM ingredients o, ingredients s
WHERE o.name = 'aguacate' AND s.name = 'crema' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.957, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 1.67
FROM ingredients o, ingredients s
WHERE o.name = 'algarroba en polvo' AND s.name = 'xilitol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.957, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'algarroba en polvo' AND s.name = 'eritritol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9397, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 2.08
FROM ingredients o, ingredients s
WHERE o.name = 'algarroba en polvo' AND s.name = 'stevia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9353, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.25
FROM ingredients o, ingredients s
WHERE o.name = 'algarroba en polvo' AND s.name = 'cacao en polvo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9311, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.83
FROM ingredients o, ingredients s
WHERE o.name = 'algarroba en polvo' AND s.name = 'canela' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9923, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.67
FROM ingredients o, ingredients s
WHERE o.name = 'almidon de maiz' AND s.name = 'tapioca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9859, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.33
FROM ingredients o, ingredients s
WHERE o.name = 'almidon de maiz' AND s.name = 'almidon de papa' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.976, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.33
FROM ingredients o, ingredients s
WHERE o.name = 'almidon de maiz' AND s.name = 'harina de garbanzo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9738, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.3
FROM ingredients o, ingredients s
WHERE o.name = 'almidon de maiz' AND s.name = 'harina de trigo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9738, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.33
FROM ingredients o, ingredients s
WHERE o.name = 'almidon de maiz' AND s.name = 'semola' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9859, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.75
FROM ingredients o, ingredients s
WHERE o.name = 'almidon de papa' AND s.name = 'almidon de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9843, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'almidon de papa' AND s.name = 'harina de garbanzo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9825, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.25
FROM ingredients o, ingredients s
WHERE o.name = 'almidon de papa' AND s.name = 'tapioca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9612, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.3
FROM ingredients o, ingredients s
WHERE o.name = 'almidon de papa' AND s.name = 'harina integral' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9311, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'almidon de papa' AND s.name = 'harina de quinoa' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9792, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'aquafaba' AND s.name = 'yogur natural' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9692, 'Similar en: aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.0
FROM ingredients o, ingredients s
WHERE o.name = 'aquafaba' AND s.name = 'yogur vegano' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9475, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 4.0
FROM ingredients o, ingredients s
WHERE o.name = 'aquafaba' AND s.name = 'gel de chia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9418, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.5
FROM ingredients o, ingredients s
WHERE o.name = 'aquafaba' AND s.name = 'tofu sedoso' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9292, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 9.0
FROM ingredients o, ingredients s
WHERE o.name = 'aquafaba' AND s.name = 'psyllium husk' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9179, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'avena' AND s.name = 'harina de avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9028, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 4.0
FROM ingredients o, ingredients s
WHERE o.name = 'avena' AND s.name = 'harina de quinoa' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9016, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.6
FROM ingredients o, ingredients s
WHERE o.name = 'avena' AND s.name = 'harina integral' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8892, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'avena' AND s.name = 'semola' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8892, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.45
FROM ingredients o, ingredients s
WHERE o.name = 'avena' AND s.name = 'harina de trigo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'azucar blanca' AND s.name = 'azucar flor' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9949, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 20.83
FROM ingredients o, ingredients s
WHERE o.name = 'azucar blanca' AND s.name = 'stevia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9935, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 11.67
FROM ingredients o, ingredients s
WHERE o.name = 'azucar blanca' AND s.name = 'azucar de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9867, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.67
FROM ingredients o, ingredients s
WHERE o.name = 'azucar blanca' AND s.name = 'azucar morena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9867, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.33
FROM ingredients o, ingredients s
WHERE o.name = 'azucar blanca' AND s.name = 'panela' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.994, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.79
FROM ingredients o, ingredients s
WHERE o.name = 'azucar de coco' AND s.name = 'stevia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9935, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 0.09
FROM ingredients o, ingredients s
WHERE o.name = 'azucar de coco' AND s.name = 'azucar blanca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9935, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 0.13
FROM ingredients o, ingredients s
WHERE o.name = 'azucar de coco' AND s.name = 'azucar flor' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9887, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.29
FROM ingredients o, ingredients s
WHERE o.name = 'azucar de coco' AND s.name = 'eritritol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9887, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.43
FROM ingredients o, ingredients s
WHERE o.name = 'azucar de coco' AND s.name = 'xilitol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'azucar flor' AND s.name = 'azucar flor' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9949, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 13.89
FROM ingredients o, ingredients s
WHERE o.name = 'azucar flor' AND s.name = 'stevia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9935, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 7.78
FROM ingredients o, ingredients s
WHERE o.name = 'azucar flor' AND s.name = 'azucar de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9867, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.11
FROM ingredients o, ingredients s
WHERE o.name = 'azucar flor' AND s.name = 'azucar morena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9867, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.22
FROM ingredients o, ingredients s
WHERE o.name = 'azucar flor' AND s.name = 'panela' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'azucar morena' AND s.name = 'azucar morena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9953, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 6.0
FROM ingredients o, ingredients s
WHERE o.name = 'azucar morena' AND s.name = 'miel' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9947, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 10.0
FROM ingredients o, ingredients s
WHERE o.name = 'azucar morena' AND s.name = 'jarabe de maple' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9881, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 5.0
FROM ingredients o, ingredients s
WHERE o.name = 'azucar morena' AND s.name = 'datiles molidos' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9867, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.6
FROM ingredients o, ingredients s
WHERE o.name = 'azucar morena' AND s.name = 'azucar blanca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9994, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'bicarbonato de sodio' AND s.name = 'levadura seca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9981, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.6
FROM ingredients o, ingredients s
WHERE o.name = 'bicarbonato de sodio' AND s.name = 'polvo de hornear' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9953, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.2
FROM ingredients o, ingredients s
WHERE o.name = 'bicarbonato de sodio' AND s.name = 'levadura fresca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9673, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor', TRUE, TRUE, 3.0
FROM ingredients o, ingredients s
WHERE o.name = 'bicarbonato de sodio' AND s.name = 'cremor tartaro' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8741, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor', TRUE, TRUE, 0.4
FROM ingredients o, ingredients s
WHERE o.name = 'bicarbonato de sodio' AND s.name = 'vinagre blanco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9193, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.4
FROM ingredients o, ingredients s
WHERE o.name = 'buttermilk' AND s.name = 'yogur vegano' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8875, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 1.6
FROM ingredients o, ingredients s
WHERE o.name = 'buttermilk' AND s.name = 'yogur natural' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8745, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor', TRUE, TRUE, 0.88
FROM ingredients o, ingredients s
WHERE o.name = 'buttermilk' AND s.name = 'leche de soya' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8717, 'Similar en: aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.8
FROM ingredients o, ingredients s
WHERE o.name = 'buttermilk' AND s.name = 'aquafaba' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8622, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor', FALSE, TRUE, 0.44
FROM ingredients o, ingredients s
WHERE o.name = 'buttermilk' AND s.name = 'leche entera' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9302, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.68
FROM ingredients o, ingredients s
WHERE o.name = 'cacao amargo' AND s.name = 'cacao en polvo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8938, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.68
FROM ingredients o, ingredients s
WHERE o.name = 'cacao amargo' AND s.name = 'nueces molidas' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8721, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.27
FROM ingredients o, ingredients s
WHERE o.name = 'cacao amargo' AND s.name = 'manteca vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8639, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.41
FROM ingredients o, ingredients s
WHERE o.name = 'cacao amargo' AND s.name = 'aceite de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8481, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.36
FROM ingredients o, ingredients s
WHERE o.name = 'cacao amargo' AND s.name = 'aceite de oliva' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9353, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.8
FROM ingredients o, ingredients s
WHERE o.name = 'cacao en polvo' AND s.name = 'algarroba en polvo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9302, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.47
FROM ingredients o, ingredients s
WHERE o.name = 'cacao en polvo' AND s.name = 'cacao amargo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8775, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'cacao en polvo' AND s.name = 'canela' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8445, 'Similar en: poder aglutinante, aporte de humedad, capacidad leudante', TRUE, TRUE, 1.2
FROM ingredients o, ingredients s
WHERE o.name = 'cacao en polvo' AND s.name = 'chocolate cobertura' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8427, 'Similar en: poder aglutinante, aporte de humedad, capacidad leudante', TRUE, TRUE, 1.33
FROM ingredients o, ingredients s
WHERE o.name = 'cacao en polvo' AND s.name = 'xilitol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9756, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.25
FROM ingredients o, ingredients s
WHERE o.name = 'cafe soluble' AND s.name = 'vainilla extracto' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9674, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.02
FROM ingredients o, ingredients s
WHERE o.name = 'cafe soluble' AND s.name = 'sal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9673, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.1
FROM ingredients o, ingredients s
WHERE o.name = 'cafe soluble' AND s.name = 'harina de arroz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9547, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.08
FROM ingredients o, ingredients s
WHERE o.name = 'cafe soluble' AND s.name = 'harina de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9451, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.15
FROM ingredients o, ingredients s
WHERE o.name = 'cafe soluble' AND s.name = 'jugo de limon' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9801, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.5
FROM ingredients o, ingredients s
WHERE o.name = 'canela' AND s.name = 'vainilla extracto' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9692, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.15
FROM ingredients o, ingredients s
WHERE o.name = 'canela' AND s.name = 'harina de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9662, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.05
FROM ingredients o, ingredients s
WHERE o.name = 'canela' AND s.name = 'sal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9311, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.2
FROM ingredients o, ingredients s
WHERE o.name = 'canela' AND s.name = 'algarroba en polvo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9297, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.2
FROM ingredients o, ingredients s
WHERE o.name = 'canela' AND s.name = 'harina de arroz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9956, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.9
FROM ingredients o, ingredients s
WHERE o.name = 'chocolate blanco' AND s.name = 'chocolate cobertura' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8637, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.06
FROM ingredients o, ingredients s
WHERE o.name = 'chocolate blanco' AND s.name = 'azucar blanca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8637, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.09
FROM ingredients o, ingredients s
WHERE o.name = 'chocolate blanco' AND s.name = 'azucar flor' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8591, 'Similar en: poder aglutinante, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.4
FROM ingredients o, ingredients s
WHERE o.name = 'chocolate blanco' AND s.name = 'leche condensada' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8444, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.25
FROM ingredients o, ingredients s
WHERE o.name = 'chocolate blanco' AND s.name = 'stevia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9956, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 1.11
FROM ingredients o, ingredients s
WHERE o.name = 'chocolate cobertura' AND s.name = 'chocolate blanco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.871, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.07
FROM ingredients o, ingredients s
WHERE o.name = 'chocolate cobertura' AND s.name = 'azucar blanca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.871, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.1
FROM ingredients o, ingredients s
WHERE o.name = 'chocolate cobertura' AND s.name = 'azucar flor' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8516, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.39
FROM ingredients o, ingredients s
WHERE o.name = 'chocolate cobertura' AND s.name = 'stevia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8478, 'Similar en: poder aglutinante, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.44
FROM ingredients o, ingredients s
WHERE o.name = 'chocolate cobertura' AND s.name = 'leche condensada' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9884, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.17
FROM ingredients o, ingredients s
WHERE o.name = 'crema' AND s.name = 'crema de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9555, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.83
FROM ingredients o, ingredients s
WHERE o.name = 'crema' AND s.name = 'aguacate' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9409, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.83
FROM ingredients o, ingredients s
WHERE o.name = 'crema' AND s.name = 'crema agria' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9378, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.58
FROM ingredients o, ingredients s
WHERE o.name = 'crema' AND s.name = 'leche de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9326, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 3.33
FROM ingredients o, ingredients s
WHERE o.name = 'crema' AND s.name = 'queso crema' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9409, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', FALSE, TRUE, 1.2
FROM ingredients o, ingredients s
WHERE o.name = 'crema agria' AND s.name = 'crema' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9351, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.7
FROM ingredients o, ingredients s
WHERE o.name = 'crema agria' AND s.name = 'leche de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.892, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.4
FROM ingredients o, ingredients s
WHERE o.name = 'crema agria' AND s.name = 'crema de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8805, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'crema agria' AND s.name = 'aguacate' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8682, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.22
FROM ingredients o, ingredients s
WHERE o.name = 'crema agria' AND s.name = 'leche entera' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9884, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.86
FROM ingredients o, ingredients s
WHERE o.name = 'crema de coco' AND s.name = 'crema' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9445, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.71
FROM ingredients o, ingredients s
WHERE o.name = 'crema de coco' AND s.name = 'aguacate' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9393, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 2.86
FROM ingredients o, ingredients s
WHERE o.name = 'crema de coco' AND s.name = 'queso crema' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9343, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.57
FROM ingredients o, ingredients s
WHERE o.name = 'crema de coco' AND s.name = 'aceite de girasol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9343, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.57
FROM ingredients o, ingredients s
WHERE o.name = 'crema de coco' AND s.name = 'aceite vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9673, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor', TRUE, TRUE, 0.33
FROM ingredients o, ingredients s
WHERE o.name = 'cremor tartaro' AND s.name = 'bicarbonato de sodio' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9582, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'cremor tartaro' AND s.name = 'levadura seca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9524, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.13
FROM ingredients o, ingredients s
WHERE o.name = 'cremor tartaro' AND s.name = 'vinagre blanco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.95, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor', TRUE, TRUE, 0.53
FROM ingredients o, ingredients s
WHERE o.name = 'cremor tartaro' AND s.name = 'polvo de hornear' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9404, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor', TRUE, TRUE, 0.4
FROM ingredients o, ingredients s
WHERE o.name = 'cremor tartaro' AND s.name = 'levadura fresca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9922, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 1.2
FROM ingredients o, ingredients s
WHERE o.name = 'datiles molidos' AND s.name = 'miel' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9902, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'datiles molidos' AND s.name = 'jarabe de maple' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9881, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.2
FROM ingredients o, ingredients s
WHERE o.name = 'datiles molidos' AND s.name = 'azucar morena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9881, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.4
FROM ingredients o, ingredients s
WHERE o.name = 'datiles molidos' AND s.name = 'panela' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9646, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'datiles molidos' AND s.name = 'jarabe de agave' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'eritritol' AND s.name = 'eritritol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9977, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.39
FROM ingredients o, ingredients s
WHERE o.name = 'eritritol' AND s.name = 'stevia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9887, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.78
FROM ingredients o, ingredients s
WHERE o.name = 'eritritol' AND s.name = 'azucar de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9858, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 0.07
FROM ingredients o, ingredients s
WHERE o.name = 'eritritol' AND s.name = 'azucar blanca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9858, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 0.1
FROM ingredients o, ingredients s
WHERE o.name = 'eritritol' AND s.name = 'azucar flor' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9954, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.62
FROM ingredients o, ingredients s
WHERE o.name = 'gel de chia' AND s.name = 'tofu sedoso' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9936, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.75
FROM ingredients o, ingredients s
WHERE o.name = 'gel de chia' AND s.name = 'gel de linaza' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9727, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.25
FROM ingredients o, ingredients s
WHERE o.name = 'gel de chia' AND s.name = 'psyllium husk' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.97, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', FALSE, TRUE, 43.75
FROM ingredients o, ingredients s
WHERE o.name = 'gel de chia' AND s.name = 'huevo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.961, 'Similar en: aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'gel de chia' AND s.name = 'yogur natural' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9936, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.33
FROM ingredients o, ingredients s
WHERE o.name = 'gel de linaza' AND s.name = 'gel de chia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9867, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.83
FROM ingredients o, ingredients s
WHERE o.name = 'gel de linaza' AND s.name = 'tofu sedoso' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9832, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 58.33
FROM ingredients o, ingredients s
WHERE o.name = 'gel de linaza' AND s.name = 'huevo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9654, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.0
FROM ingredients o, ingredients s
WHERE o.name = 'gel de linaza' AND s.name = 'psyllium husk' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9348, 'Similar en: aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'gel de linaza' AND s.name = 'yogur natural' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'gelatina sin sabor' AND s.name = 'agar agar' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9931, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.12
FROM ingredients o, ingredients s
WHERE o.name = 'gelatina sin sabor' AND s.name = 'goma xantana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9822, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.25
FROM ingredients o, ingredients s
WHERE o.name = 'gelatina sin sabor' AND s.name = 'psyllium husk' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9226, 'Similar en: poder aglutinante, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.75
FROM ingredients o, ingredients s
WHERE o.name = 'gelatina sin sabor' AND s.name = 'gel de linaza' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9196, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'gelatina sin sabor' AND s.name = 'gel de chia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9931, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.48
FROM ingredients o, ingredients s
WHERE o.name = 'goma xantana' AND s.name = 'agar agar' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9931, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.32
FROM ingredients o, ingredients s
WHERE o.name = 'goma xantana' AND s.name = 'gelatina sin sabor' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9679, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.72
FROM ingredients o, ingredients s
WHERE o.name = 'goma xantana' AND s.name = 'psyllium husk' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9168, 'Similar en: poder aglutinante, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.24
FROM ingredients o, ingredients s
WHERE o.name = 'goma xantana' AND s.name = 'gel de linaza' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9035, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.32
FROM ingredients o, ingredients s
WHERE o.name = 'goma xantana' AND s.name = 'gel de chia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9838, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 1.11
FROM ingredients o, ingredients s
WHERE o.name = 'harina de almendra' AND s.name = 'queso crema' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9718, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.56
FROM ingredients o, ingredients s
WHERE o.name = 'harina de almendra' AND s.name = 'mantequilla de mani' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9611, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.28
FROM ingredients o, ingredients s
WHERE o.name = 'harina de almendra' AND s.name = 'aguacate' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9448, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'harina de almendra' AND s.name = 'mantequilla' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9436, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.83
FROM ingredients o, ingredients s
WHERE o.name = 'harina de almendra' AND s.name = 'nueces molidas' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9881, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.75
FROM ingredients o, ingredients s
WHERE o.name = 'harina de arroz' AND s.name = 'harina de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9862, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.25
FROM ingredients o, ingredients s
WHERE o.name = 'harina de arroz' AND s.name = 'sal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9786, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'harina de arroz' AND s.name = 'semola' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9786, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.45
FROM ingredients o, ingredients s
WHERE o.name = 'harina de arroz' AND s.name = 'harina de trigo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.978, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'harina de arroz' AND s.name = 'harina de avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9925, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.3
FROM ingredients o, ingredients s
WHERE o.name = 'harina de avena' AND s.name = 'harina de trigo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9925, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.33
FROM ingredients o, ingredients s
WHERE o.name = 'harina de avena' AND s.name = 'semola' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.978, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'harina de avena' AND s.name = 'harina de arroz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9644, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'harina de avena' AND s.name = 'harina de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9629, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.67
FROM ingredients o, ingredients s
WHERE o.name = 'harina de avena' AND s.name = 'tapioca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.871, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'harina de coco' AND s.name = 'semillas de lino' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8681, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'harina de coco' AND s.name = 'harina de almendra' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8658, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.83
FROM ingredients o, ingredients s
WHERE o.name = 'harina de coco' AND s.name = 'mantequilla de mani' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8188, 'Similar en: aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.08
FROM ingredients o, ingredients s
WHERE o.name = 'harina de coco' AND s.name = 'goma xantana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8059, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.25
FROM ingredients o, ingredients s
WHERE o.name = 'harina de coco' AND s.name = 'nueces molidas' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9882, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.25
FROM ingredients o, ingredients s
WHERE o.name = 'harina de garbanzo' AND s.name = 'tapioca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9843, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'harina de garbanzo' AND s.name = 'almidon de papa' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9813, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.3
FROM ingredients o, ingredients s
WHERE o.name = 'harina de garbanzo' AND s.name = 'harina integral' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.976, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.75
FROM ingredients o, ingredients s
WHERE o.name = 'harina de garbanzo' AND s.name = 'almidon de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9432, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.25
FROM ingredients o, ingredients s
WHERE o.name = 'harina de garbanzo' AND s.name = 'semola' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9881, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.33
FROM ingredients o, ingredients s
WHERE o.name = 'harina de maiz' AND s.name = 'harina de arroz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9865, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.33
FROM ingredients o, ingredients s
WHERE o.name = 'harina de maiz' AND s.name = 'sal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9836, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 16.67
FROM ingredients o, ingredients s
WHERE o.name = 'harina de maiz' AND s.name = 'vainilla extracto' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9692, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 6.67
FROM ingredients o, ingredients s
WHERE o.name = 'harina de maiz' AND s.name = 'canela' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9644, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'harina de maiz' AND s.name = 'harina de avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9777, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.15
FROM ingredients o, ingredients s
WHERE o.name = 'harina de quinoa' AND s.name = 'harina integral' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9427, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'harina de quinoa' AND s.name = 'harina de garbanzo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9351, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.62
FROM ingredients o, ingredients s
WHERE o.name = 'harina de quinoa' AND s.name = 'tapioca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9311, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'harina de quinoa' AND s.name = 'almidon de papa' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9239, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.38
FROM ingredients o, ingredients s
WHERE o.name = 'harina de quinoa' AND s.name = 'almidon de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'harina de trigo' AND s.name = 'harina de trigo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9925, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.33
FROM ingredients o, ingredients s
WHERE o.name = 'harina de trigo' AND s.name = 'harina de avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9786, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.22
FROM ingredients o, ingredients s
WHERE o.name = 'harina de trigo' AND s.name = 'harina de arroz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9769, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 5.56
FROM ingredients o, ingredients s
WHERE o.name = 'harina de trigo' AND s.name = 'tapioca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9738, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.33
FROM ingredients o, ingredients s
WHERE o.name = 'harina de trigo' AND s.name = 'almidon de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9813, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.33
FROM ingredients o, ingredients s
WHERE o.name = 'harina integral' AND s.name = 'harina de garbanzo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9809, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 4.17
FROM ingredients o, ingredients s
WHERE o.name = 'harina integral' AND s.name = 'tapioca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9777, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 6.67
FROM ingredients o, ingredients s
WHERE o.name = 'harina integral' AND s.name = 'harina de quinoa' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9612, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.33
FROM ingredients o, ingredients s
WHERE o.name = 'harina integral' AND s.name = 'almidon de papa' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9599, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.5
FROM ingredients o, ingredients s
WHERE o.name = 'harina integral' AND s.name = 'almidon de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9832, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.02
FROM ingredients o, ingredients s
WHERE o.name = 'huevo' AND s.name = 'gel de linaza' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.97, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.02
FROM ingredients o, ingredients s
WHERE o.name = 'huevo' AND s.name = 'gel de chia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9562, 'Similar en: aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.01
FROM ingredients o, ingredients s
WHERE o.name = 'huevo' AND s.name = 'tofu sedoso' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.937, 'Similar en: aporte de humedad, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.01
FROM ingredients o, ingredients s
WHERE o.name = 'huevo' AND s.name = 'yogur natural' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9146, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.05
FROM ingredients o, ingredients s
WHERE o.name = 'huevo' AND s.name = 'psyllium husk' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9919, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.33
FROM ingredients o, ingredients s
WHERE o.name = 'jarabe de agave' AND s.name = 'jarabe de maple' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9882, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.8
FROM ingredients o, ingredients s
WHERE o.name = 'jarabe de agave' AND s.name = 'miel' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9839, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.13
FROM ingredients o, ingredients s
WHERE o.name = 'jarabe de agave' AND s.name = 'azucar morena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9839, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.27
FROM ingredients o, ingredients s
WHERE o.name = 'jarabe de agave' AND s.name = 'panela' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9691, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.08
FROM ingredients o, ingredients s
WHERE o.name = 'jarabe de agave' AND s.name = 'azucar blanca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.999, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.6
FROM ingredients o, ingredients s
WHERE o.name = 'jarabe de maple' AND s.name = 'miel' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9947, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.2
FROM ingredients o, ingredients s
WHERE o.name = 'jarabe de maple' AND s.name = 'panela' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9947, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.1
FROM ingredients o, ingredients s
WHERE o.name = 'jarabe de maple' AND s.name = 'azucar morena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9919, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.75
FROM ingredients o, ingredients s
WHERE o.name = 'jarabe de maple' AND s.name = 'jarabe de agave' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9902, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'jarabe de maple' AND s.name = 'datiles molidos' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9571, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'jugo de limon' AND s.name = 'vinagre blanco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9451, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 6.67
FROM ingredients o, ingredients s
WHERE o.name = 'jugo de limon' AND s.name = 'cafe soluble' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9158, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 8.33
FROM ingredients o, ingredients s
WHERE o.name = 'jugo de limon' AND s.name = 'vainilla extracto' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8826, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.17
FROM ingredients o, ingredients s
WHERE o.name = 'jugo de limon' AND s.name = 'sal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8692, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'jugo de limon' AND s.name = 'harina de arroz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9462, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', FALSE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'leche condensada' AND s.name = 'miel' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9353, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.5
FROM ingredients o, ingredients s
WHERE o.name = 'leche condensada' AND s.name = 'jarabe de maple' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9287, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.25
FROM ingredients o, ingredients s
WHERE o.name = 'leche condensada' AND s.name = 'datiles molidos' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9264, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.88
FROM ingredients o, ingredients s
WHERE o.name = 'leche condensada' AND s.name = 'jarabe de agave' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9247, 'Similar en: poder aglutinante, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'leche condensada' AND s.name = 'panela' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9939, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.6
FROM ingredients o, ingredients s
WHERE o.name = 'leche de almendra' AND s.name = 'leche de macadamia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9939, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.12
FROM ingredients o, ingredients s
WHERE o.name = 'leche de almendra' AND s.name = 'leche de avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9939, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.36
FROM ingredients o, ingredients s
WHERE o.name = 'leche de almendra' AND s.name = 'leche descremada' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9843, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.88
FROM ingredients o, ingredients s
WHERE o.name = 'leche de almendra' AND s.name = 'leche de soya' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9819, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.8
FROM ingredients o, ingredients s
WHERE o.name = 'leche de almendra' AND s.name = 'leche de arroz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9881, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.45
FROM ingredients o, ingredients s
WHERE o.name = 'leche de arroz' AND s.name = 'leche descremada' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9881, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.4
FROM ingredients o, ingredients s
WHERE o.name = 'leche de arroz' AND s.name = 'leche de avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9819, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.25
FROM ingredients o, ingredients s
WHERE o.name = 'leche de arroz' AND s.name = 'leche de almendra' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9681, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'leche de arroz' AND s.name = 'leche de macadamia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9385, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.1
FROM ingredients o, ingredients s
WHERE o.name = 'leche de arroz' AND s.name = 'leche de soya' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'leche de avena' AND s.name = 'leche de avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9939, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.89
FROM ingredients o, ingredients s
WHERE o.name = 'leche de avena' AND s.name = 'leche de almendra' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9881, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.71
FROM ingredients o, ingredients s
WHERE o.name = 'leche de avena' AND s.name = 'leche de arroz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9845, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.43
FROM ingredients o, ingredients s
WHERE o.name = 'leche de avena' AND s.name = 'leche de macadamia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9771, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.79
FROM ingredients o, ingredients s
WHERE o.name = 'leche de avena' AND s.name = 'leche de soya' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9378, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', FALSE, TRUE, 1.71
FROM ingredients o, ingredients s
WHERE o.name = 'leche de coco' AND s.name = 'crema' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9351, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 1.43
FROM ingredients o, ingredients s
WHERE o.name = 'leche de coco' AND s.name = 'crema agria' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9284, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.31
FROM ingredients o, ingredients s
WHERE o.name = 'leche de coco' AND s.name = 'leche entera' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9036, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'leche de coco' AND s.name = 'crema de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9023, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.14
FROM ingredients o, ingredients s
WHERE o.name = 'leche de coco' AND s.name = 'leche de macadamia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9939, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.62
FROM ingredients o, ingredients s
WHERE o.name = 'leche de macadamia' AND s.name = 'leche de almendra' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9845, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.7
FROM ingredients o, ingredients s
WHERE o.name = 'leche de macadamia' AND s.name = 'leche de avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9845, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.22
FROM ingredients o, ingredients s
WHERE o.name = 'leche de macadamia' AND s.name = 'leche descremada' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9839, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.55
FROM ingredients o, ingredients s
WHERE o.name = 'leche de macadamia' AND s.name = 'leche de soya' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9681, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'leche de macadamia' AND s.name = 'leche de arroz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9868, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'leche de soya' AND s.name = 'leche entera' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9843, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.14
FROM ingredients o, ingredients s
WHERE o.name = 'leche de soya' AND s.name = 'leche de almendra' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9839, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.82
FROM ingredients o, ingredients s
WHERE o.name = 'leche de soya' AND s.name = 'leche de macadamia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9771, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.41
FROM ingredients o, ingredients s
WHERE o.name = 'leche de soya' AND s.name = 'leche descremada' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9771, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.27
FROM ingredients o, ingredients s
WHERE o.name = 'leche de soya' AND s.name = 'leche de avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.11
FROM ingredients o, ingredients s
WHERE o.name = 'leche descremada' AND s.name = 'leche de avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9939, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.78
FROM ingredients o, ingredients s
WHERE o.name = 'leche descremada' AND s.name = 'leche de almendra' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9881, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.22
FROM ingredients o, ingredients s
WHERE o.name = 'leche descremada' AND s.name = 'leche de arroz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9845, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 4.44
FROM ingredients o, ingredients s
WHERE o.name = 'leche descremada' AND s.name = 'leche de macadamia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9771, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.44
FROM ingredients o, ingredients s
WHERE o.name = 'leche descremada' AND s.name = 'leche de soya' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9868, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'leche entera' AND s.name = 'leche de soya' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9673, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.64
FROM ingredients o, ingredients s
WHERE o.name = 'leche entera' AND s.name = 'leche de macadamia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9651, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.82
FROM ingredients o, ingredients s
WHERE o.name = 'leche entera' AND s.name = 'leche descremada' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9651, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.55
FROM ingredients o, ingredients s
WHERE o.name = 'leche entera' AND s.name = 'leche de avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9598, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.27
FROM ingredients o, ingredients s
WHERE o.name = 'leche entera' AND s.name = 'leche de almendra' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9989, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.33
FROM ingredients o, ingredients s
WHERE o.name = 'levadura fresca' AND s.name = 'polvo de hornear' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9977, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.67
FROM ingredients o, ingredients s
WHERE o.name = 'levadura fresca' AND s.name = 'levadura seca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9953, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.83
FROM ingredients o, ingredients s
WHERE o.name = 'levadura fresca' AND s.name = 'bicarbonato de sodio' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9404, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor', TRUE, TRUE, 2.5
FROM ingredients o, ingredients s
WHERE o.name = 'levadura fresca' AND s.name = 'cremor tartaro' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8428, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor', TRUE, TRUE, 0.33
FROM ingredients o, ingredients s
WHERE o.name = 'levadura fresca' AND s.name = 'vinagre blanco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9996, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.8
FROM ingredients o, ingredients s
WHERE o.name = 'levadura seca' AND s.name = 'polvo de hornear' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9994, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'levadura seca' AND s.name = 'bicarbonato de sodio' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9977, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.6
FROM ingredients o, ingredients s
WHERE o.name = 'levadura seca' AND s.name = 'levadura fresca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9582, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'levadura seca' AND s.name = 'cremor tartaro' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8598, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor', TRUE, TRUE, 0.2
FROM ingredients o, ingredients s
WHERE o.name = 'levadura seca' AND s.name = 'vinagre blanco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9967, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'manteca vegetal' AND s.name = 'aceite de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9967, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.33
FROM ingredients o, ingredients s
WHERE o.name = 'manteca vegetal' AND s.name = 'aceite de oliva' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9965, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'manteca vegetal' AND s.name = 'aceite vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9965, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'manteca vegetal' AND s.name = 'aceite de girasol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9937, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.33
FROM ingredients o, ingredients s
WHERE o.name = 'manteca vegetal' AND s.name = 'margarina vegana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9993, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'mantequilla' AND s.name = 'margarina vegana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9944, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.33
FROM ingredients o, ingredients s
WHERE o.name = 'mantequilla' AND s.name = 'aceite vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9944, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.33
FROM ingredients o, ingredients s
WHERE o.name = 'mantequilla' AND s.name = 'aceite de girasol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9915, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'mantequilla' AND s.name = 'manteca vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9905, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'mantequilla' AND s.name = 'aceite de oliva' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9718, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.8
FROM ingredients o, ingredients s
WHERE o.name = 'mantequilla de mani' AND s.name = 'harina de almendra' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9612, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'mantequilla de mani' AND s.name = 'queso crema' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9511, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 1.2
FROM ingredients o, ingredients s
WHERE o.name = 'mantequilla de mani' AND s.name = 'mantequilla' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9427, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.8
FROM ingredients o, ingredients s
WHERE o.name = 'mantequilla de mani' AND s.name = 'margarina vegana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9417, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'mantequilla de mani' AND s.name = 'nueces molidas' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9993, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'margarina vegana' AND s.name = 'mantequilla' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9955, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'margarina vegana' AND s.name = 'aceite vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9955, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'margarina vegana' AND s.name = 'aceite de girasol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9937, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.75
FROM ingredients o, ingredients s
WHERE o.name = 'margarina vegana' AND s.name = 'manteca vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9932, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'margarina vegana' AND s.name = 'aceite de oliva' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.999, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.67
FROM ingredients o, ingredients s
WHERE o.name = 'miel' AND s.name = 'jarabe de maple' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9953, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.33
FROM ingredients o, ingredients s
WHERE o.name = 'miel' AND s.name = 'panela' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9953, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.17
FROM ingredients o, ingredients s
WHERE o.name = 'miel' AND s.name = 'azucar morena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9922, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.83
FROM ingredients o, ingredients s
WHERE o.name = 'miel' AND s.name = 'datiles molidos' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9882, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.25
FROM ingredients o, ingredients s
WHERE o.name = 'miel' AND s.name = 'jarabe de agave' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9749, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.53
FROM ingredients o, ingredients s
WHERE o.name = 'nueces molidas' AND s.name = 'margarina vegana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9709, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.8
FROM ingredients o, ingredients s
WHERE o.name = 'nueces molidas' AND s.name = 'mantequilla' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9687, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.4
FROM ingredients o, ingredients s
WHERE o.name = 'nueces molidas' AND s.name = 'manteca vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9564, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.6
FROM ingredients o, ingredients s
WHERE o.name = 'nueces molidas' AND s.name = 'aceite de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9556, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.27
FROM ingredients o, ingredients s
WHERE o.name = 'nueces molidas' AND s.name = 'aceite vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'panela' AND s.name = 'azucar morena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9953, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 3.0
FROM ingredients o, ingredients s
WHERE o.name = 'panela' AND s.name = 'miel' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9947, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 5.0
FROM ingredients o, ingredients s
WHERE o.name = 'panela' AND s.name = 'jarabe de maple' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9881, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.5
FROM ingredients o, ingredients s
WHERE o.name = 'panela' AND s.name = 'datiles molidos' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9867, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.3
FROM ingredients o, ingredients s
WHERE o.name = 'panela' AND s.name = 'azucar blanca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9949, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'platano maduro' AND s.name = 'pure de manzana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9726, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'platano maduro' AND s.name = 'pure de zapallo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9726, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'platano maduro' AND s.name = 'pure de calabaza' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.944, 'Similar en: aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'platano maduro' AND s.name = 'pure de remolacha' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8959, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', FALSE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'platano maduro' AND s.name = 'yogur natural' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9996, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.25
FROM ingredients o, ingredients s
WHERE o.name = 'polvo de hornear' AND s.name = 'levadura seca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9989, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.75
FROM ingredients o, ingredients s
WHERE o.name = 'polvo de hornear' AND s.name = 'levadura fresca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9981, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.62
FROM ingredients o, ingredients s
WHERE o.name = 'polvo de hornear' AND s.name = 'bicarbonato de sodio' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.95, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor', TRUE, TRUE, 1.88
FROM ingredients o, ingredients s
WHERE o.name = 'polvo de hornear' AND s.name = 'cremor tartaro' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8475, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor', TRUE, TRUE, 0.25
FROM ingredients o, ingredients s
WHERE o.name = 'polvo de hornear' AND s.name = 'vinagre blanco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9822, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'psyllium husk' AND s.name = 'agar agar' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9822, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.44
FROM ingredients o, ingredients s
WHERE o.name = 'psyllium husk' AND s.name = 'gelatina sin sabor' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9727, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.44
FROM ingredients o, ingredients s
WHERE o.name = 'psyllium husk' AND s.name = 'gel de chia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9679, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.39
FROM ingredients o, ingredients s
WHERE o.name = 'psyllium husk' AND s.name = 'goma xantana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9678, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.28
FROM ingredients o, ingredients s
WHERE o.name = 'psyllium husk' AND s.name = 'tofu sedoso' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'pure de calabaza' AND s.name = 'pure de calabaza' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9918, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'pure de calabaza' AND s.name = 'pure de remolacha' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.991, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'pure de calabaza' AND s.name = 'pure de manzana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9726, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'pure de calabaza' AND s.name = 'platano maduro' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.944, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.0
FROM ingredients o, ingredients s
WHERE o.name = 'pure de calabaza' AND s.name = 'yogur vegano' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9949, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'pure de manzana' AND s.name = 'platano maduro' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.991, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'pure de manzana' AND s.name = 'pure de zapallo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.991, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'pure de manzana' AND s.name = 'pure de calabaza' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.971, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'pure de manzana' AND s.name = 'pure de remolacha' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9163, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', FALSE, TRUE, 1.33
FROM ingredients o, ingredients s
WHERE o.name = 'pure de manzana' AND s.name = 'yogur natural' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9918, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'pure de remolacha' AND s.name = 'pure de zapallo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9918, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'pure de remolacha' AND s.name = 'pure de calabaza' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.971, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'pure de remolacha' AND s.name = 'pure de manzana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.944, 'Similar en: aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'pure de remolacha' AND s.name = 'platano maduro' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.938, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.0
FROM ingredients o, ingredients s
WHERE o.name = 'pure de remolacha' AND s.name = 'yogur vegano' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'pure de zapallo' AND s.name = 'pure de calabaza' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9918, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'pure de zapallo' AND s.name = 'pure de remolacha' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.991, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'pure de zapallo' AND s.name = 'pure de manzana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9726, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'pure de zapallo' AND s.name = 'platano maduro' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.944, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.0
FROM ingredients o, ingredients s
WHERE o.name = 'pure de zapallo' AND s.name = 'yogur vegano' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9838, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.9
FROM ingredients o, ingredients s
WHERE o.name = 'queso crema' AND s.name = 'harina de almendra' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9738, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.25
FROM ingredients o, ingredients s
WHERE o.name = 'queso crema' AND s.name = 'aguacate' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9612, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'queso crema' AND s.name = 'mantequilla de mani' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9442, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.6
FROM ingredients o, ingredients s
WHERE o.name = 'queso crema' AND s.name = 'mantequilla' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9393, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.35
FROM ingredients o, ingredients s
WHERE o.name = 'queso crema' AND s.name = 'crema de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9883, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 50.0
FROM ingredients o, ingredients s
WHERE o.name = 'sal' AND s.name = 'vainilla extracto' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9865, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.0
FROM ingredients o, ingredients s
WHERE o.name = 'sal' AND s.name = 'harina de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9862, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 4.0
FROM ingredients o, ingredients s
WHERE o.name = 'sal' AND s.name = 'harina de arroz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9674, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 40.0
FROM ingredients o, ingredients s
WHERE o.name = 'sal' AND s.name = 'cafe soluble' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9662, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 20.0
FROM ingredients o, ingredients s
WHERE o.name = 'sal' AND s.name = 'canela' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.922, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.5
FROM ingredients o, ingredients s
WHERE o.name = 'semillas de lino' AND s.name = 'nueces molidas' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9109, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.33
FROM ingredients o, ingredients s
WHERE o.name = 'semillas de lino' AND s.name = 'harina de quinoa' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8999, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.0
FROM ingredients o, ingredients s
WHERE o.name = 'semillas de lino' AND s.name = 'harina de almendra' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.871, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'semillas de lino' AND s.name = 'harina de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8427, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.83
FROM ingredients o, ingredients s
WHERE o.name = 'semillas de lino' AND s.name = 'aguacate' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.9
FROM ingredients o, ingredients s
WHERE o.name = 'semola' AND s.name = 'harina de trigo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9925, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.0
FROM ingredients o, ingredients s
WHERE o.name = 'semola' AND s.name = 'harina de avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9786, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'semola' AND s.name = 'harina de arroz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9769, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 5.0
FROM ingredients o, ingredients s
WHERE o.name = 'semola' AND s.name = 'tapioca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9738, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.0
FROM ingredients o, ingredients s
WHERE o.name = 'semola' AND s.name = 'almidon de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9977, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.72
FROM ingredients o, ingredients s
WHERE o.name = 'stevia' AND s.name = 'eritritol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9977, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.8
FROM ingredients o, ingredients s
WHERE o.name = 'stevia' AND s.name = 'xilitol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9949, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.07
FROM ingredients o, ingredients s
WHERE o.name = 'stevia' AND s.name = 'azucar flor' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9949, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.05
FROM ingredients o, ingredients s
WHERE o.name = 'stevia' AND s.name = 'azucar blanca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.994, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.56
FROM ingredients o, ingredients s
WHERE o.name = 'stevia' AND s.name = 'azucar de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9923, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.6
FROM ingredients o, ingredients s
WHERE o.name = 'tapioca' AND s.name = 'almidon de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9882, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.8
FROM ingredients o, ingredients s
WHERE o.name = 'tapioca' AND s.name = 'harina de garbanzo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9825, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.8
FROM ingredients o, ingredients s
WHERE o.name = 'tapioca' AND s.name = 'almidon de papa' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9809, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.24
FROM ingredients o, ingredients s
WHERE o.name = 'tapioca' AND s.name = 'harina integral' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9769, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.2
FROM ingredients o, ingredients s
WHERE o.name = 'tapioca' AND s.name = 'semola' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9954, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.6
FROM ingredients o, ingredients s
WHERE o.name = 'tofu sedoso' AND s.name = 'gel de chia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9867, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.2
FROM ingredients o, ingredients s
WHERE o.name = 'tofu sedoso' AND s.name = 'gel de linaza' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9678, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.6
FROM ingredients o, ingredients s
WHERE o.name = 'tofu sedoso' AND s.name = 'psyllium husk' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.958, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.8
FROM ingredients o, ingredients s
WHERE o.name = 'tofu sedoso' AND s.name = 'yogur natural' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9562, 'Similar en: aporte de humedad, nivel de dulzor, capacidad leudante', FALSE, TRUE, 70.0
FROM ingredients o, ingredients s
WHERE o.name = 'tofu sedoso' AND s.name = 'huevo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9883, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.02
FROM ingredients o, ingredients s
WHERE o.name = 'vainilla extracto' AND s.name = 'sal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9836, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.06
FROM ingredients o, ingredients s
WHERE o.name = 'vainilla extracto' AND s.name = 'harina de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9801, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.4
FROM ingredients o, ingredients s
WHERE o.name = 'vainilla extracto' AND s.name = 'canela' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9756, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.8
FROM ingredients o, ingredients s
WHERE o.name = 'vainilla extracto' AND s.name = 'cafe soluble' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9682, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.08
FROM ingredients o, ingredients s
WHERE o.name = 'vainilla extracto' AND s.name = 'harina de arroz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9571, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'vinagre blanco' AND s.name = 'jugo de limon' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9524, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 7.5
FROM ingredients o, ingredients s
WHERE o.name = 'vinagre blanco' AND s.name = 'cremor tartaro' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8982, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 10.0
FROM ingredients o, ingredients s
WHERE o.name = 'vinagre blanco' AND s.name = 'cafe soluble' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8793, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.25
FROM ingredients o, ingredients s
WHERE o.name = 'vinagre blanco' AND s.name = 'sal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.876, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 12.5
FROM ingredients o, ingredients s
WHERE o.name = 'vinagre blanco' AND s.name = 'vainilla extracto' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.9
FROM ingredients o, ingredients s
WHERE o.name = 'xilitol' AND s.name = 'eritritol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9977, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.25
FROM ingredients o, ingredients s
WHERE o.name = 'xilitol' AND s.name = 'stevia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9887, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.7
FROM ingredients o, ingredients s
WHERE o.name = 'xilitol' AND s.name = 'azucar de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9858, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 0.06
FROM ingredients o, ingredients s
WHERE o.name = 'xilitol' AND s.name = 'azucar blanca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9858, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 0.09
FROM ingredients o, ingredients s
WHERE o.name = 'xilitol' AND s.name = 'azucar flor' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9792, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'yogur natural' AND s.name = 'aquafaba' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9786, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'yogur natural' AND s.name = 'yogur vegano' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.961, 'Similar en: aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'yogur natural' AND s.name = 'gel de chia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.958, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.25
FROM ingredients o, ingredients s
WHERE o.name = 'yogur natural' AND s.name = 'tofu sedoso' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.937, 'Similar en: aporte de humedad, nivel de dulzor, capacidad leudante', FALSE, TRUE, 87.5
FROM ingredients o, ingredients s
WHERE o.name = 'yogur natural' AND s.name = 'huevo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9786, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'yogur vegano' AND s.name = 'yogur natural' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9692, 'Similar en: aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.33
FROM ingredients o, ingredients s
WHERE o.name = 'yogur vegano' AND s.name = 'aquafaba' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.944, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.33
FROM ingredients o, ingredients s
WHERE o.name = 'yogur vegano' AND s.name = 'pure de zapallo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.944, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.33
FROM ingredients o, ingredients s
WHERE o.name = 'yogur vegano' AND s.name = 'pure de calabaza' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.938, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.33
FROM ingredients o, ingredients s
WHERE o.name = 'yogur vegano' AND s.name = 'pure de remolacha' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;

COMMIT;

SELECT COUNT(*) AS total_sustitutos FROM substitutes;
SELECT i.name AS original, s2.name AS sustituto, s.similarity_score, s.vegan_safe, s.gluten_free_safe
FROM substitutes s
JOIN ingredients i  ON i.id  = s.original_id
JOIN ingredients s2 ON s2.id = s.substitute_id
WHERE i.name = 'huevo'
ORDER BY s.similarity_score DESC;