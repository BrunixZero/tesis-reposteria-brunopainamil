-- IMPORTACION MODELO KNN
-- Ejecutar: Get-Content import_modelo.sql | docker exec -i reposteria-db psql -U bruno -d reposteria_db

BEGIN;

-- 1. Limpiar sustitutos manuales
DELETE FROM substitutes;

-- 2. Insertar ingredientes nuevos
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'huevo', 'unidad', 9, 7.9, 1.0, 0.0, 1, FALSE, TRUE, 350.0, 'unidad'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'huevo');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'gel de linaza', 'g', 8, 9.1, 0.4, 0.0, 0, TRUE, TRUE, 6.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'gel de linaza');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'gel de chia', 'g', 8, 8.9, 0.3, 0.0, 0, TRUE, TRUE, 8.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'gel de chia');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'aquafaba', 'ml', 7, 9.7, 0.0, 0.1, 2, TRUE, TRUE, 2.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'aquafaba');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'pure de manzana', 'g', 6, 9.1, 0.0, 1.0, 0, TRUE, TRUE, 3.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'pure de manzana');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'platano maduro', 'g', 7, 7.7, 0.0, 1.2, 0, TRUE, TRUE, 2.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'platano maduro');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'yogur natural', 'g', 5, 8.8, 0.4, 0.5, 1, FALSE, TRUE, 4.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'yogur natural');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'yogur vegano', 'g', 4, 8.9, 0.3, 0.4, 1, TRUE, TRUE, 6.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'yogur vegano');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'tofu sedoso', 'g', 6, 9.2, 0.3, 0.1, 0, TRUE, TRUE, 5.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'tofu sedoso');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'queso crema', 'ml', 3, 5.6, 3.4, 0.3, 0, FALSE, TRUE, 20.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'queso crema');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'gelatina sin sabor', 'g', 7, 1.3, 0.0, 0.0, 0, FALSE, TRUE, 8.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'gelatina sin sabor');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'agar agar', 'g', 7, 1.2, 0.0, 0.0, 0, TRUE, TRUE, 12.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'agar agar');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'psyllium husk', 'g', 8, 0.9, 0.1, 0.0, 0, TRUE, TRUE, 18.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'psyllium husk');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'goma xantana', 'g', 9, 1.0, 0.0, 0.0, 0, TRUE, TRUE, 25.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'goma xantana');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'pure de zapallo', 'g', 5, 9.4, 0.0, 0.3, 0, TRUE, TRUE, 2.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'pure de zapallo');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'pure de remolacha', 'g', 4, 9.1, 0.0, 0.7, 0, TRUE, TRUE, 2.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'pure de remolacha');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'harina de trigo', 'g', 2, 1.1, 0.1, 0.0, 0, TRUE, FALSE, 0.9, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'harina de trigo');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'harina integral', 'g', 3, 1.0, 0.2, 0.0, 0, TRUE, FALSE, 1.2, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'harina integral');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'harina de almendra', 'g', 3, 0.4, 5.0, 0.4, 0, TRUE, TRUE, 18.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'harina de almendra');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'harina de avena', 'g', 2, 0.8, 0.7, 0.0, 0, TRUE, TRUE, 3.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'harina de avena');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'harina de arroz', 'g', 1, 1.2, 0.1, 0.0, 0, TRUE, TRUE, 2.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'harina de arroz');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'harina de coco', 'g', 4, 0.5, 1.2, 0.7, 0, TRUE, TRUE, 12.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'harina de coco');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'harina de maiz', 'g', 1, 1.0, 0.4, 0.1, 0, TRUE, TRUE, 1.5, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'harina de maiz');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'harina de garbanzo', 'g', 3, 1.0, 0.6, 1.0, 0, TRUE, TRUE, 4.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'harina de garbanzo');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'harina de quinoa', 'g', 3, 1.0, 0.6, 0.2, 0, TRUE, TRUE, 8.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'harina de quinoa');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'almidon de maiz', 'g', 3, 0.8, 0.0, 0.0, 0, TRUE, TRUE, 3.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'almidon de maiz');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'almidon de papa', 'g', 4, 1.8, 0.0, 0.0, 0, TRUE, TRUE, 4.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'almidon de papa');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'tapioca', 'g', 3, 1.3, 0.0, 0.0, 0, TRUE, TRUE, 5.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'tapioca');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'semola', 'g', 2, 1.2, 0.1, 0.1, 0, TRUE, FALSE, 1.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'semola');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'mantequilla', 'g', 1, 1.6, 8.1, 0.0, 0, FALSE, TRUE, 12.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'mantequilla');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'margarina vegana', 'g', 1, 1.6, 8.0, 0.0, 0, TRUE, TRUE, 8.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'margarina vegana');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'aceite vegetal', 'ml', 0, 0.0, 10.0, 0.0, 0, TRUE, TRUE, 4.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'aceite vegetal');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'aceite de coco', 'ml', 0, 0.0, 10.0, 0.0, 0, TRUE, TRUE, 9.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'aceite de coco');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'aceite de oliva', 'ml', 0, 0.0, 10.0, 0.0, 0, TRUE, TRUE, 8.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'aceite de oliva');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'manteca vegetal', 'g', 0, 0.0, 10.0, 0.0, 0, TRUE, TRUE, 6.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'manteca vegetal');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'crema', 'ml', 1, 6.0, 3.7, 0.3, 0, FALSE, TRUE, 6.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'crema');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'crema de coco', 'ml', 1, 5.6, 3.4, 0.3, 0, TRUE, TRUE, 7.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'crema de coco');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'aguacate', 'g', 2, 7.5, 1.5, 0.1, 0, TRUE, TRUE, 5.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'aguacate');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'mantequilla de mani', 'g', 3, 0.2, 5.0, 0.6, 0, TRUE, TRUE, 10.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'mantequilla de mani');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'aceite de girasol', 'ml', 0, 0.0, 10.0, 0.0, 0, TRUE, TRUE, 4.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'aceite de girasol');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'azucar blanca', 'g', 0, 0.0, 0.0, 10.0, 0, TRUE, TRUE, 1.2, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'azucar blanca');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'azucar morena', 'g', 1, 0.2, 0.0, 9.6, 0, TRUE, TRUE, 2.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'azucar morena');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'azucar flor', 'g', 0, 0.1, 0.0, 9.9, 0, TRUE, TRUE, 1.8, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'azucar flor');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'miel', 'g', 1, 1.8, 0.0, 8.2, 0, FALSE, TRUE, 12.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'miel');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'jarabe de maple', 'g', 1, 3.3, 0.0, 6.0, 0, TRUE, TRUE, 20.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'jarabe de maple');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'jarabe de agave', 'g', 0, 2.4, 0.0, 6.8, 0, TRUE, TRUE, 15.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'jarabe de agave');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'stevia', 'g', 0, 0.2, 0.0, 8.0, 0, TRUE, TRUE, 25.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'stevia');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'eritritol', 'g', 0, 0.0, 0.0, 7.0, 0, TRUE, TRUE, 18.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'eritritol');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'azucar de coco', 'g', 1, 0.2, 0.0, 7.5, 0, TRUE, TRUE, 14.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'azucar de coco');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'datiles molidos', 'g', 2, 2.2, 0.0, 6.4, 0, TRUE, TRUE, 10.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'datiles molidos');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'panela', 'g', 1, 0.2, 0.0, 9.0, 0, TRUE, TRUE, 4.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'panela');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'xilitol', 'g', 0, 0.0, 0.0, 7.0, 0, TRUE, TRUE, 20.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'xilitol');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'leche entera', 'ml', 2, 9.0, 0.4, 0.5, 0, FALSE, TRUE, 1.1, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'leche entera');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'leche descremada', 'ml', 1, 9.4, 0.0, 0.5, 0, FALSE, TRUE, 0.9, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'leche descremada');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'leche de almendra', 'ml', 1, 10.0, 0.1, 0.0, 0, TRUE, TRUE, 2.5, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'leche de almendra');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'leche de coco', 'ml', 1, 7.0, 2.4, 0.3, 0, TRUE, TRUE, 3.5, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'leche de coco');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'leche de avena', 'ml', 1, 9.3, 0.2, 0.4, 0, TRUE, TRUE, 2.8, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'leche de avena');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'leche de soya', 'ml', 2, 9.2, 0.2, 0.1, 0, TRUE, TRUE, 2.2, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'leche de soya');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'leche de arroz', 'ml', 0, 9.2, 0.1, 0.3, 0, TRUE, TRUE, 2.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'leche de arroz');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'buttermilk', 'ml', 3, 9.3, 0.1, 0.5, 3, FALSE, TRUE, 2.5, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'buttermilk');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'leche condensada', 'ml', 1, 2.8, 0.9, 5.5, 0, FALSE, TRUE, 8.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'leche condensada');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'leche de macadamia', 'ml', 1, 9.9, 0.3, 0.1, 0, TRUE, TRUE, 4.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'leche de macadamia');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'crema agria', 'ml', 2, 7.3, 2.0, 0.4, 1, FALSE, TRUE, 5.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'crema agria');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'polvo de hornear', 'g', 0, 0.5, 0.0, 0.0, 10, TRUE, TRUE, 8.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'polvo de hornear');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'bicarbonato de sodio', 'g', 0, 0.0, 0.0, 0.0, 8, TRUE, TRUE, 5.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'bicarbonato de sodio');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'levadura seca', 'g', 0, 0.5, 0.2, 0.0, 9, TRUE, TRUE, 10.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'levadura seca');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'levadura fresca', 'g', 0, 7.0, 0.0, 0.0, 10, TRUE, TRUE, 6.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'levadura fresca');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'cremor tartaro', 'g', 0, 0.0, 0.0, 0.0, 4, TRUE, TRUE, 15.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'cremor tartaro');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'vainilla extracto', 'ml', 0, 5.5, 0.0, 1.3, 0, TRUE, TRUE, 25.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'vainilla extracto');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'canela', 'g', 0, 1.1, 0.1, 0.2, 0, TRUE, TRUE, 10.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'canela');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'cacao en polvo', 'g', 1, 0.3, 1.4, 0.2, 0, TRUE, TRUE, 15.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'cacao en polvo');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'chocolate cobertura', 'g', 1, 0.1, 3.0, 5.0, 0, TRUE, TRUE, 18.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'chocolate cobertura');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'chocolate blanco', 'g', 0, 0.1, 3.2, 5.9, 0, FALSE, TRUE, 20.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'chocolate blanco');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'cacao amargo', 'g', 1, 0.3, 1.4, 0.2, 0, TRUE, TRUE, 22.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'cacao amargo');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'algarroba en polvo', 'g', 1, 0.4, 0.1, 3.2, 0, TRUE, TRUE, 12.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'algarroba en polvo');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'sal', 'g', 0, 0.0, 0.0, 0.0, 0, TRUE, TRUE, 0.5, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'sal');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'vinagre blanco', 'ml', 0, 9.8, 0.0, 0.0, 2, TRUE, TRUE, 2.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'vinagre blanco');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'jugo de limon', 'ml', 0, 9.3, 0.0, 0.3, 1, TRUE, TRUE, 3.0, 'ml'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'jugo de limon');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'cafe soluble', 'g', 0, 0.4, 0.0, 0.0, 0, TRUE, TRUE, 20.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'cafe soluble');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'nueces molidas', 'g', 2, 0.4, 6.5, 0.3, 0, TRUE, TRUE, 15.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'nueces molidas');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'avena', 'g', 2, 0.8, 0.7, 0.1, 0, TRUE, TRUE, 2.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'avena');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'semillas de lino', 'g', 3, 0.7, 4.2, 0.2, 0, TRUE, TRUE, 6.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'semillas de lino');
INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT 'pure de calabaza', 'g', 5, 9.4, 0.0, 0.3, 0, TRUE, TRUE, 2.0, 'g'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = 'pure de calabaza');

-- 3. Insertar pares de sustitutos del modelo KNN
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.44
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de coco' AND s.name = 'aceite vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de coco' AND s.name = 'manteca vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.89
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de coco' AND s.name = 'aceite de oliva' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.44
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de coco' AND s.name = 'aceite de girasol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9963, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.89
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de coco' AND s.name = 'margarina vegana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de girasol' AND s.name = 'aceite vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de girasol' AND s.name = 'manteca vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de girasol' AND s.name = 'aceite de oliva' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.25
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de girasol' AND s.name = 'aceite de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9963, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de girasol' AND s.name = 'margarina vegana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de oliva' AND s.name = 'aceite vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.75
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de oliva' AND s.name = 'manteca vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.12
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de oliva' AND s.name = 'aceite de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de oliva' AND s.name = 'aceite de girasol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9963, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'aceite de oliva' AND s.name = 'margarina vegana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'aceite vegetal' AND s.name = 'manteca vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'aceite vegetal' AND s.name = 'aceite de oliva' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.25
FROM ingredients o, ingredients s
WHERE o.name = 'aceite vegetal' AND s.name = 'aceite de coco' AND o.id <> s.id
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
SELECT o.id, s.id, 0.9963, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'aceite vegetal' AND s.name = 'margarina vegana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'agar agar' AND s.name = 'gelatina sin sabor' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9987, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'agar agar' AND s.name = 'psyllium husk' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9964, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.08
FROM ingredients o, ingredients s
WHERE o.name = 'agar agar' AND s.name = 'goma xantana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9531, 'Similar en: aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.33
FROM ingredients o, ingredients s
WHERE o.name = 'agar agar' AND s.name = 'almidon de papa' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9318, 'Similar en: aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'agar agar' AND s.name = 'harina de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9747, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.44
FROM ingredients o, ingredients s
WHERE o.name = 'aguacate' AND s.name = 'leche de soya' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9732, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.22
FROM ingredients o, ingredients s
WHERE o.name = 'aguacate' AND s.name = 'leche entera' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9693, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.8
FROM ingredients o, ingredients s
WHERE o.name = 'aguacate' AND s.name = 'leche de macadamia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9667, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'aguacate' AND s.name = 'leche de almendra' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9594, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.56
FROM ingredients o, ingredients s
WHERE o.name = 'aguacate' AND s.name = 'leche de avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9426, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 1.67
FROM ingredients o, ingredients s
WHERE o.name = 'algarroba en polvo' AND s.name = 'xilitol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9426, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'algarroba en polvo' AND s.name = 'eritritol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.921, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 2.08
FROM ingredients o, ingredients s
WHERE o.name = 'algarroba en polvo' AND s.name = 'stevia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9173, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 1.17
FROM ingredients o, ingredients s
WHERE o.name = 'algarroba en polvo' AND s.name = 'azucar de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8938, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 0.1
FROM ingredients o, ingredients s
WHERE o.name = 'algarroba en polvo' AND s.name = 'azucar blanca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9992, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.4
FROM ingredients o, ingredients s
WHERE o.name = 'almidon de maiz' AND s.name = 'harina integral' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9977, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.67
FROM ingredients o, ingredients s
WHERE o.name = 'almidon de maiz' AND s.name = 'tapioca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9931, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.67
FROM ingredients o, ingredients s
WHERE o.name = 'almidon de maiz' AND s.name = 'harina de quinoa' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9735, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.33
FROM ingredients o, ingredients s
WHERE o.name = 'almidon de maiz' AND s.name = 'harina de garbanzo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9655, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.3
FROM ingredients o, ingredients s
WHERE o.name = 'almidon de maiz' AND s.name = 'harina de trigo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.967, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.25
FROM ingredients o, ingredients s
WHERE o.name = 'almidon de papa' AND s.name = 'tapioca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9605, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.3
FROM ingredients o, ingredients s
WHERE o.name = 'almidon de papa' AND s.name = 'harina integral' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9571, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.75
FROM ingredients o, ingredients s
WHERE o.name = 'almidon de papa' AND s.name = 'almidon de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9531, 'Similar en: aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.0
FROM ingredients o, ingredients s
WHERE o.name = 'almidon de papa' AND s.name = 'agar agar' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.953, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'almidon de papa' AND s.name = 'harina de quinoa' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9861, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'aquafaba' AND s.name = 'yogur natural' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9654, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 175.0
FROM ingredients o, ingredients s
WHERE o.name = 'aquafaba' AND s.name = 'huevo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9632, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.0
FROM ingredients o, ingredients s
WHERE o.name = 'aquafaba' AND s.name = 'gel de linaza' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9624, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 4.0
FROM ingredients o, ingredients s
WHERE o.name = 'aquafaba' AND s.name = 'gel de chia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9617, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.5
FROM ingredients o, ingredients s
WHERE o.name = 'aquafaba' AND s.name = 'tofu sedoso' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9998, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'avena' AND s.name = 'harina de avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.987, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.45
FROM ingredients o, ingredients s
WHERE o.name = 'avena' AND s.name = 'harina de trigo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9851, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'avena' AND s.name = 'semola' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9609, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.75
FROM ingredients o, ingredients s
WHERE o.name = 'avena' AND s.name = 'harina de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9555, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 4.0
FROM ingredients o, ingredients s
WHERE o.name = 'avena' AND s.name = 'harina de quinoa' AND o.id <> s.id
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
SELECT o.id, s.id, 0.9972, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 20.83
FROM ingredients o, ingredients s
WHERE o.name = 'azucar blanca' AND s.name = 'stevia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.997, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.33
FROM ingredients o, ingredients s
WHERE o.name = 'azucar blanca' AND s.name = 'panela' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9966, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.67
FROM ingredients o, ingredients s
WHERE o.name = 'azucar blanca' AND s.name = 'azucar morena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9956, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 11.67
FROM ingredients o, ingredients s
WHERE o.name = 'azucar blanca' AND s.name = 'azucar de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9979, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.29
FROM ingredients o, ingredients s
WHERE o.name = 'azucar de coco' AND s.name = 'panela' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9964, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 0.14
FROM ingredients o, ingredients s
WHERE o.name = 'azucar de coco' AND s.name = 'azucar morena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9956, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 0.09
FROM ingredients o, ingredients s
WHERE o.name = 'azucar de coco' AND s.name = 'azucar blanca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9954, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 0.13
FROM ingredients o, ingredients s
WHERE o.name = 'azucar de coco' AND s.name = 'azucar flor' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.995, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.79
FROM ingredients o, ingredients s
WHERE o.name = 'azucar de coco' AND s.name = 'stevia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'azucar flor' AND s.name = 'azucar blanca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9973, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 13.89
FROM ingredients o, ingredients s
WHERE o.name = 'azucar flor' AND s.name = 'stevia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9968, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.22
FROM ingredients o, ingredients s
WHERE o.name = 'azucar flor' AND s.name = 'panela' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9964, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.11
FROM ingredients o, ingredients s
WHERE o.name = 'azucar flor' AND s.name = 'azucar morena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9954, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 7.78
FROM ingredients o, ingredients s
WHERE o.name = 'azucar flor' AND s.name = 'azucar de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9998, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'azucar morena' AND s.name = 'panela' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9966, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.6
FROM ingredients o, ingredients s
WHERE o.name = 'azucar morena' AND s.name = 'azucar blanca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9964, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.9
FROM ingredients o, ingredients s
WHERE o.name = 'azucar morena' AND s.name = 'azucar flor' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9964, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 7.0
FROM ingredients o, ingredients s
WHERE o.name = 'azucar morena' AND s.name = 'azucar de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9964, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 6.0
FROM ingredients o, ingredients s
WHERE o.name = 'azucar morena' AND s.name = 'miel' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9988, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'bicarbonato de sodio' AND s.name = 'levadura seca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9977, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.6
FROM ingredients o, ingredients s
WHERE o.name = 'bicarbonato de sodio' AND s.name = 'polvo de hornear' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9706, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor', TRUE, TRUE, 3.0
FROM ingredients o, ingredients s
WHERE o.name = 'bicarbonato de sodio' AND s.name = 'cremor tartaro' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9536, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.2
FROM ingredients o, ingredients s
WHERE o.name = 'bicarbonato de sodio' AND s.name = 'levadura fresca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.686, 'Similar en: contenido graso, nivel de dulzor', FALSE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'bicarbonato de sodio' AND s.name = 'buttermilk' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.925, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.4
FROM ingredients o, ingredients s
WHERE o.name = 'buttermilk' AND s.name = 'yogur vegano' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8976, 'Similar en: aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.8
FROM ingredients o, ingredients s
WHERE o.name = 'buttermilk' AND s.name = 'vinagre blanco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.893, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 1.6
FROM ingredients o, ingredients s
WHERE o.name = 'buttermilk' AND s.name = 'yogur natural' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8892, 'Similar en: aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.8
FROM ingredients o, ingredients s
WHERE o.name = 'buttermilk' AND s.name = 'aquafaba' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8861, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'buttermilk' AND s.name = 'crema agria' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.68
FROM ingredients o, ingredients s
WHERE o.name = 'cacao amargo' AND s.name = 'cacao en polvo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9668, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.07
FROM ingredients o, ingredients s
WHERE o.name = 'cacao amargo' AND s.name = 'harina de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9605, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.02
FROM ingredients o, ingredients s
WHERE o.name = 'cacao amargo' AND s.name = 'sal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.953, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.91
FROM ingredients o, ingredients s
WHERE o.name = 'cacao amargo' AND s.name = 'cafe soluble' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9495, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.09
FROM ingredients o, ingredients s
WHERE o.name = 'cacao amargo' AND s.name = 'avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.47
FROM ingredients o, ingredients s
WHERE o.name = 'cacao en polvo' AND s.name = 'cacao amargo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9668, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.1
FROM ingredients o, ingredients s
WHERE o.name = 'cacao en polvo' AND s.name = 'harina de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9605, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.03
FROM ingredients o, ingredients s
WHERE o.name = 'cacao en polvo' AND s.name = 'sal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.953, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.33
FROM ingredients o, ingredients s
WHERE o.name = 'cacao en polvo' AND s.name = 'cafe soluble' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9495, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.13
FROM ingredients o, ingredients s
WHERE o.name = 'cacao en polvo' AND s.name = 'avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9992, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.02
FROM ingredients o, ingredients s
WHERE o.name = 'cafe soluble' AND s.name = 'sal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9972, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'cafe soluble' AND s.name = 'canela' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9893, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.08
FROM ingredients o, ingredients s
WHERE o.name = 'cafe soluble' AND s.name = 'harina de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9865, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.1
FROM ingredients o, ingredients s
WHERE o.name = 'cafe soluble' AND s.name = 'harina de arroz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.953, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.75
FROM ingredients o, ingredients s
WHERE o.name = 'cafe soluble' AND s.name = 'cacao en polvo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9972, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'canela' AND s.name = 'cafe soluble' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9937, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.05
FROM ingredients o, ingredients s
WHERE o.name = 'canela' AND s.name = 'sal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9796, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.15
FROM ingredients o, ingredients s
WHERE o.name = 'canela' AND s.name = 'harina de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9792, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.2
FROM ingredients o, ingredients s
WHERE o.name = 'canela' AND s.name = 'harina de arroz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9358, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'canela' AND s.name = 'cacao en polvo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9921, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.9
FROM ingredients o, ingredients s
WHERE o.name = 'chocolate blanco' AND s.name = 'chocolate cobertura' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9292, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'chocolate blanco' AND s.name = 'xilitol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9292, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.9
FROM ingredients o, ingredients s
WHERE o.name = 'chocolate blanco' AND s.name = 'eritritol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9289, 'Similar en: poder aglutinante, aporte de humedad, capacidad leudante', TRUE, TRUE, 1.25
FROM ingredients o, ingredients s
WHERE o.name = 'chocolate blanco' AND s.name = 'stevia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.927, 'Similar en: poder aglutinante, aporte de humedad, capacidad leudante', TRUE, TRUE, 0.06
FROM ingredients o, ingredients s
WHERE o.name = 'chocolate blanco' AND s.name = 'azucar blanca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9921, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 1.11
FROM ingredients o, ingredients s
WHERE o.name = 'chocolate cobertura' AND s.name = 'chocolate blanco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9149, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.11
FROM ingredients o, ingredients s
WHERE o.name = 'chocolate cobertura' AND s.name = 'xilitol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9149, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'chocolate cobertura' AND s.name = 'eritritol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.914, 'Similar en: poder aglutinante, aporte de humedad, capacidad leudante', TRUE, TRUE, 1.39
FROM ingredients o, ingredients s
WHERE o.name = 'chocolate cobertura' AND s.name = 'stevia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.914, 'Similar en: poder aglutinante, aporte de humedad, capacidad leudante', TRUE, TRUE, 0.07
FROM ingredients o, ingredients s
WHERE o.name = 'chocolate cobertura' AND s.name = 'azucar blanca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9985, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.17
FROM ingredients o, ingredients s
WHERE o.name = 'crema' AND s.name = 'crema de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9533, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.58
FROM ingredients o, ingredients s
WHERE o.name = 'crema' AND s.name = 'leche de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8812, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 3.33
FROM ingredients o, ingredients s
WHERE o.name = 'crema' AND s.name = 'queso crema' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8435, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.83
FROM ingredients o, ingredients s
WHERE o.name = 'crema' AND s.name = 'crema agria' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8432, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.83
FROM ingredients o, ingredients s
WHERE o.name = 'crema' AND s.name = 'aguacate' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.948, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'crema agria' AND s.name = 'aguacate' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9232, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.8
FROM ingredients o, ingredients s
WHERE o.name = 'crema agria' AND s.name = 'leche de macadamia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9214, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.7
FROM ingredients o, ingredients s
WHERE o.name = 'crema agria' AND s.name = 'leche de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9187, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.22
FROM ingredients o, ingredients s
WHERE o.name = 'crema agria' AND s.name = 'leche entera' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9184, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'crema agria' AND s.name = 'leche de almendra' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9985, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.86
FROM ingredients o, ingredients s
WHERE o.name = 'crema de coco' AND s.name = 'crema' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9532, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'crema de coco' AND s.name = 'leche de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8675, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 2.86
FROM ingredients o, ingredients s
WHERE o.name = 'crema de coco' AND s.name = 'queso crema' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.839, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.71
FROM ingredients o, ingredients s
WHERE o.name = 'crema de coco' AND s.name = 'aguacate' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8348, 'Similar en: poder aglutinante, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.14
FROM ingredients o, ingredients s
WHERE o.name = 'crema de coco' AND s.name = 'margarina vegana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9706, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor', TRUE, TRUE, 0.33
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
SELECT o.id, s.id, 0.9525, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor', TRUE, TRUE, 0.53
FROM ingredients o, ingredients s
WHERE o.name = 'cremor tartaro' AND s.name = 'polvo de hornear' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8771, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor', TRUE, TRUE, 0.4
FROM ingredients o, ingredients s
WHERE o.name = 'cremor tartaro' AND s.name = 'levadura fresca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.7547, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor', TRUE, TRUE, 0.03
FROM ingredients o, ingredients s
WHERE o.name = 'cremor tartaro' AND s.name = 'sal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9923, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 1.2
FROM ingredients o, ingredients s
WHERE o.name = 'datiles molidos' AND s.name = 'miel' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9899, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 0.2
FROM ingredients o, ingredients s
WHERE o.name = 'datiles molidos' AND s.name = 'azucar morena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.989, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 0.4
FROM ingredients o, ingredients s
WHERE o.name = 'datiles molidos' AND s.name = 'panela' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9837, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.4
FROM ingredients o, ingredients s
WHERE o.name = 'datiles molidos' AND s.name = 'azucar de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9796, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'datiles molidos' AND s.name = 'jarabe de maple' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.11
FROM ingredients o, ingredients s
WHERE o.name = 'eritritol' AND s.name = 'xilitol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9979, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.39
FROM ingredients o, ingredients s
WHERE o.name = 'eritritol' AND s.name = 'stevia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9912, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.78
FROM ingredients o, ingredients s
WHERE o.name = 'eritritol' AND s.name = 'azucar de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9906, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 0.07
FROM ingredients o, ingredients s
WHERE o.name = 'eritritol' AND s.name = 'azucar blanca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9906, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 0.1
FROM ingredients o, ingredients s
WHERE o.name = 'eritritol' AND s.name = 'azucar flor' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9999, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.75
FROM ingredients o, ingredients s
WHERE o.name = 'gel de chia' AND s.name = 'gel de linaza' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9934, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.25
FROM ingredients o, ingredients s
WHERE o.name = 'gel de chia' AND s.name = 'platano maduro' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9872, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.62
FROM ingredients o, ingredients s
WHERE o.name = 'gel de chia' AND s.name = 'tofu sedoso' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9857, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 43.75
FROM ingredients o, ingredients s
WHERE o.name = 'gel de chia' AND s.name = 'huevo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9839, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.38
FROM ingredients o, ingredients s
WHERE o.name = 'gel de chia' AND s.name = 'pure de manzana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9999, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.33
FROM ingredients o, ingredients s
WHERE o.name = 'gel de linaza' AND s.name = 'gel de chia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9926, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.33
FROM ingredients o, ingredients s
WHERE o.name = 'gel de linaza' AND s.name = 'platano maduro' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9884, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.83
FROM ingredients o, ingredients s
WHERE o.name = 'gel de linaza' AND s.name = 'tofu sedoso' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9852, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 58.33
FROM ingredients o, ingredients s
WHERE o.name = 'gel de linaza' AND s.name = 'huevo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9848, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'gel de linaza' AND s.name = 'pure de manzana' AND o.id <> s.id
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
SELECT o.id, s.id, 0.9987, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.25
FROM ingredients o, ingredients s
WHERE o.name = 'gelatina sin sabor' AND s.name = 'psyllium husk' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9967, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.12
FROM ingredients o, ingredients s
WHERE o.name = 'gelatina sin sabor' AND s.name = 'goma xantana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9523, 'Similar en: aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'gelatina sin sabor' AND s.name = 'almidon de papa' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9291, 'Similar en: aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'gelatina sin sabor' AND s.name = 'harina de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9991, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.72
FROM ingredients o, ingredients s
WHERE o.name = 'goma xantana' AND s.name = 'psyllium husk' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9967, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.32
FROM ingredients o, ingredients s
WHERE o.name = 'goma xantana' AND s.name = 'gelatina sin sabor' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9964, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.48
FROM ingredients o, ingredients s
WHERE o.name = 'goma xantana' AND s.name = 'agar agar' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9247, 'Similar en: aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.16
FROM ingredients o, ingredients s
WHERE o.name = 'goma xantana' AND s.name = 'almidon de papa' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9133, 'Similar en: aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.48
FROM ingredients o, ingredients s
WHERE o.name = 'goma xantana' AND s.name = 'harina de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9993, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.56
FROM ingredients o, ingredients s
WHERE o.name = 'harina de almendra' AND s.name = 'mantequilla de mani' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9957, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.33
FROM ingredients o, ingredients s
WHERE o.name = 'harina de almendra' AND s.name = 'semillas de lino' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9799, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.83
FROM ingredients o, ingredients s
WHERE o.name = 'harina de almendra' AND s.name = 'nueces molidas' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9321, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.44
FROM ingredients o, ingredients s
WHERE o.name = 'harina de almendra' AND s.name = 'margarina vegana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.932, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'harina de almendra' AND s.name = 'mantequilla' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.997, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.75
FROM ingredients o, ingredients s
WHERE o.name = 'harina de arroz' AND s.name = 'harina de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9865, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 10.0
FROM ingredients o, ingredients s
WHERE o.name = 'harina de arroz' AND s.name = 'cafe soluble' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9858, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.25
FROM ingredients o, ingredients s
WHERE o.name = 'harina de arroz' AND s.name = 'sal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9792, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 5.0
FROM ingredients o, ingredients s
WHERE o.name = 'harina de arroz' AND s.name = 'canela' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9663, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'harina de arroz' AND s.name = 'semola' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9998, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'harina de avena' AND s.name = 'avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9872, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.3
FROM ingredients o, ingredients s
WHERE o.name = 'harina de avena' AND s.name = 'harina de trigo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.985, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.33
FROM ingredients o, ingredients s
WHERE o.name = 'harina de avena' AND s.name = 'semola' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9604, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'harina de avena' AND s.name = 'harina de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9554, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.67
FROM ingredients o, ingredients s
WHERE o.name = 'harina de avena' AND s.name = 'harina de quinoa' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9607, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.33
FROM ingredients o, ingredients s
WHERE o.name = 'harina de coco' AND s.name = 'harina de garbanzo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9503, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'harina de coco' AND s.name = 'harina de quinoa' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9342, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.33
FROM ingredients o, ingredients s
WHERE o.name = 'harina de coco' AND s.name = 'almidon de papa' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9318, 'Similar en: aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'harina de coco' AND s.name = 'agar agar' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9291, 'Similar en: aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'harina de coco' AND s.name = 'gelatina sin sabor' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9804, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'harina de garbanzo' AND s.name = 'harina de quinoa' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9735, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.75
FROM ingredients o, ingredients s
WHERE o.name = 'harina de garbanzo' AND s.name = 'almidon de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9718, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.3
FROM ingredients o, ingredients s
WHERE o.name = 'harina de garbanzo' AND s.name = 'harina integral' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9616, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.25
FROM ingredients o, ingredients s
WHERE o.name = 'harina de garbanzo' AND s.name = 'tapioca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9607, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.0
FROM ingredients o, ingredients s
WHERE o.name = 'harina de garbanzo' AND s.name = 'harina de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.997, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.33
FROM ingredients o, ingredients s
WHERE o.name = 'harina de maiz' AND s.name = 'harina de arroz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9906, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.33
FROM ingredients o, ingredients s
WHERE o.name = 'harina de maiz' AND s.name = 'sal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9893, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 13.33
FROM ingredients o, ingredients s
WHERE o.name = 'harina de maiz' AND s.name = 'cafe soluble' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9796, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 6.67
FROM ingredients o, ingredients s
WHERE o.name = 'harina de maiz' AND s.name = 'canela' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9668, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 10.0
FROM ingredients o, ingredients s
WHERE o.name = 'harina de maiz' AND s.name = 'cacao en polvo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9958, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.15
FROM ingredients o, ingredients s
WHERE o.name = 'harina de quinoa' AND s.name = 'harina integral' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9931, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.38
FROM ingredients o, ingredients s
WHERE o.name = 'harina de quinoa' AND s.name = 'almidon de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9874, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.62
FROM ingredients o, ingredients s
WHERE o.name = 'harina de quinoa' AND s.name = 'tapioca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9804, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'harina de quinoa' AND s.name = 'harina de garbanzo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9555, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.25
FROM ingredients o, ingredients s
WHERE o.name = 'harina de quinoa' AND s.name = 'avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9998, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 1.11
FROM ingredients o, ingredients s
WHERE o.name = 'harina de trigo' AND s.name = 'semola' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9872, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.33
FROM ingredients o, ingredients s
WHERE o.name = 'harina de trigo' AND s.name = 'harina de avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.987, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.22
FROM ingredients o, ingredients s
WHERE o.name = 'harina de trigo' AND s.name = 'avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9659, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.22
FROM ingredients o, ingredients s
WHERE o.name = 'harina de trigo' AND s.name = 'harina de arroz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9655, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.33
FROM ingredients o, ingredients s
WHERE o.name = 'harina de trigo' AND s.name = 'almidon de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9992, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.5
FROM ingredients o, ingredients s
WHERE o.name = 'harina integral' AND s.name = 'almidon de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9975, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 4.17
FROM ingredients o, ingredients s
WHERE o.name = 'harina integral' AND s.name = 'tapioca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9958, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 6.67
FROM ingredients o, ingredients s
WHERE o.name = 'harina integral' AND s.name = 'harina de quinoa' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9718, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.33
FROM ingredients o, ingredients s
WHERE o.name = 'harina integral' AND s.name = 'harina de garbanzo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9624, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.75
FROM ingredients o, ingredients s
WHERE o.name = 'harina integral' AND s.name = 'harina de trigo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9857, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.02
FROM ingredients o, ingredients s
WHERE o.name = 'huevo' AND s.name = 'gel de chia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9852, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.02
FROM ingredients o, ingredients s
WHERE o.name = 'huevo' AND s.name = 'gel de linaza' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9759, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.01
FROM ingredients o, ingredients s
WHERE o.name = 'huevo' AND s.name = 'platano maduro' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9654, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.01
FROM ingredients o, ingredients s
WHERE o.name = 'huevo' AND s.name = 'aquafaba' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9531, 'Similar en: aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.01
FROM ingredients o, ingredients s
WHERE o.name = 'huevo' AND s.name = 'tofu sedoso' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.993, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.53
FROM ingredients o, ingredients s
WHERE o.name = 'jarabe de agave' AND s.name = 'leche condensada' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9912, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.33
FROM ingredients o, ingredients s
WHERE o.name = 'jarabe de agave' AND s.name = 'jarabe de maple' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9885, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.67
FROM ingredients o, ingredients s
WHERE o.name = 'jarabe de agave' AND s.name = 'stevia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9872, 'Similar en: poder aglutinante, contenido graso, capacidad leudante', TRUE, TRUE, 0.12
FROM ingredients o, ingredients s
WHERE o.name = 'jarabe de agave' AND s.name = 'azucar flor' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9865, 'Similar en: poder aglutinante, contenido graso, capacidad leudante', TRUE, TRUE, 0.08
FROM ingredients o, ingredients s
WHERE o.name = 'jarabe de agave' AND s.name = 'azucar blanca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9912, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.75
FROM ingredients o, ingredients s
WHERE o.name = 'jarabe de maple' AND s.name = 'jarabe de agave' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9901, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.4
FROM ingredients o, ingredients s
WHERE o.name = 'jarabe de maple' AND s.name = 'leche condensada' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9895, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', FALSE, TRUE, 0.6
FROM ingredients o, ingredients s
WHERE o.name = 'jarabe de maple' AND s.name = 'miel' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9796, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'jarabe de maple' AND s.name = 'datiles molidos' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9784, 'Similar en: poder aglutinante, contenido graso, capacidad leudante', TRUE, TRUE, 0.09
FROM ingredients o, ingredients s
WHERE o.name = 'jarabe de maple' AND s.name = 'azucar flor' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9868, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'jugo de limon' AND s.name = 'vinagre blanco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9832, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'jugo de limon' AND s.name = 'leche de arroz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9709, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.93
FROM ingredients o, ingredients s
WHERE o.name = 'jugo de limon' AND s.name = 'leche de avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9707, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.3
FROM ingredients o, ingredients s
WHERE o.name = 'jugo de limon' AND s.name = 'leche descremada' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9695, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.83
FROM ingredients o, ingredients s
WHERE o.name = 'jugo de limon' AND s.name = 'leche de almendra' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.993, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.88
FROM ingredients o, ingredients s
WHERE o.name = 'leche condensada' AND s.name = 'jarabe de agave' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9919, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', FALSE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'leche condensada' AND s.name = 'miel' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9905, 'Similar en: poder aglutinante, contenido graso, capacidad leudante', TRUE, TRUE, 0.22
FROM ingredients o, ingredients s
WHERE o.name = 'leche condensada' AND s.name = 'azucar flor' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9901, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.5
FROM ingredients o, ingredients s
WHERE o.name = 'leche condensada' AND s.name = 'jarabe de maple' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.99, 'Similar en: poder aglutinante, contenido graso, capacidad leudante', TRUE, TRUE, 0.15
FROM ingredients o, ingredients s
WHERE o.name = 'leche condensada' AND s.name = 'azucar blanca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9997, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.6
FROM ingredients o, ingredients s
WHERE o.name = 'leche de almendra' AND s.name = 'leche de macadamia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9991, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.12
FROM ingredients o, ingredients s
WHERE o.name = 'leche de almendra' AND s.name = 'leche de avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.998, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.36
FROM ingredients o, ingredients s
WHERE o.name = 'leche de almendra' AND s.name = 'leche descremada' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9893, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.88
FROM ingredients o, ingredients s
WHERE o.name = 'leche de almendra' AND s.name = 'leche de soya' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9888, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.44
FROM ingredients o, ingredients s
WHERE o.name = 'leche de almendra' AND s.name = 'leche entera' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9889, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.4
FROM ingredients o, ingredients s
WHERE o.name = 'leche de arroz' AND s.name = 'leche de avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.988, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.45
FROM ingredients o, ingredients s
WHERE o.name = 'leche de arroz' AND s.name = 'leche descremada' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9853, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'leche de arroz' AND s.name = 'leche de macadamia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9851, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.25
FROM ingredients o, ingredients s
WHERE o.name = 'leche de arroz' AND s.name = 'leche de almendra' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9832, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'leche de arroz' AND s.name = 'jugo de limon' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9995, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.32
FROM ingredients o, ingredients s
WHERE o.name = 'leche de avena' AND s.name = 'leche descremada' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9991, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.89
FROM ingredients o, ingredients s
WHERE o.name = 'leche de avena' AND s.name = 'leche de almendra' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.999, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.43
FROM ingredients o, ingredients s
WHERE o.name = 'leche de avena' AND s.name = 'leche de macadamia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9889, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.71
FROM ingredients o, ingredients s
WHERE o.name = 'leche de avena' AND s.name = 'leche de arroz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9862, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.39
FROM ingredients o, ingredients s
WHERE o.name = 'leche de avena' AND s.name = 'leche entera' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9533, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 1.71
FROM ingredients o, ingredients s
WHERE o.name = 'leche de coco' AND s.name = 'crema' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9532, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'leche de coco' AND s.name = 'crema de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9497, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.43
FROM ingredients o, ingredients s
WHERE o.name = 'leche de coco' AND s.name = 'aguacate' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9232, 'Similar en: poder aglutinante, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.14
FROM ingredients o, ingredients s
WHERE o.name = 'leche de coco' AND s.name = 'leche de macadamia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9214, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 1.43
FROM ingredients o, ingredients s
WHERE o.name = 'leche de coco' AND s.name = 'crema agria' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9997, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.62
FROM ingredients o, ingredients s
WHERE o.name = 'leche de macadamia' AND s.name = 'leche de almendra' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.999, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.7
FROM ingredients o, ingredients s
WHERE o.name = 'leche de macadamia' AND s.name = 'leche de avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9975, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.22
FROM ingredients o, ingredients s
WHERE o.name = 'leche de macadamia' AND s.name = 'leche descremada' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9884, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.28
FROM ingredients o, ingredients s
WHERE o.name = 'leche de macadamia' AND s.name = 'leche entera' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9879, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.55
FROM ingredients o, ingredients s
WHERE o.name = 'leche de macadamia' AND s.name = 'leche de soya' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9984, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'leche de soya' AND s.name = 'leche entera' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9893, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.14
FROM ingredients o, ingredients s
WHERE o.name = 'leche de soya' AND s.name = 'leche de almendra' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9879, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.82
FROM ingredients o, ingredients s
WHERE o.name = 'leche de soya' AND s.name = 'leche de macadamia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.985, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.27
FROM ingredients o, ingredients s
WHERE o.name = 'leche de soya' AND s.name = 'leche de avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9845, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.41
FROM ingredients o, ingredients s
WHERE o.name = 'leche de soya' AND s.name = 'leche descremada' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9995, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.11
FROM ingredients o, ingredients s
WHERE o.name = 'leche descremada' AND s.name = 'leche de avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.998, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.78
FROM ingredients o, ingredients s
WHERE o.name = 'leche descremada' AND s.name = 'leche de almendra' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9975, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 4.44
FROM ingredients o, ingredients s
WHERE o.name = 'leche descremada' AND s.name = 'leche de macadamia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.988, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.22
FROM ingredients o, ingredients s
WHERE o.name = 'leche descremada' AND s.name = 'leche de arroz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9859, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 1.22
FROM ingredients o, ingredients s
WHERE o.name = 'leche descremada' AND s.name = 'leche entera' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9984, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'leche entera' AND s.name = 'leche de soya' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9888, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.27
FROM ingredients o, ingredients s
WHERE o.name = 'leche entera' AND s.name = 'leche de almendra' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9884, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.64
FROM ingredients o, ingredients s
WHERE o.name = 'leche entera' AND s.name = 'leche de macadamia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9862, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.55
FROM ingredients o, ingredients s
WHERE o.name = 'leche entera' AND s.name = 'leche de avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9859, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.82
FROM ingredients o, ingredients s
WHERE o.name = 'leche entera' AND s.name = 'leche descremada' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9686, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.33
FROM ingredients o, ingredients s
WHERE o.name = 'levadura fresca' AND s.name = 'polvo de hornear' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9651, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.67
FROM ingredients o, ingredients s
WHERE o.name = 'levadura fresca' AND s.name = 'levadura seca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9536, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.83
FROM ingredients o, ingredients s
WHERE o.name = 'levadura fresca' AND s.name = 'bicarbonato de sodio' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8771, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor', TRUE, TRUE, 2.5
FROM ingredients o, ingredients s
WHERE o.name = 'levadura fresca' AND s.name = 'cremor tartaro' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8506, 'Similar en: contenido graso, nivel de dulzor', FALSE, TRUE, 0.42
FROM ingredients o, ingredients s
WHERE o.name = 'levadura fresca' AND s.name = 'buttermilk' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9997, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.8
FROM ingredients o, ingredients s
WHERE o.name = 'levadura seca' AND s.name = 'polvo de hornear' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9988, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'levadura seca' AND s.name = 'bicarbonato de sodio' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9651, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.6
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
SELECT o.id, s.id, 0.7094, 'Similar en: contenido graso, nivel de dulzor', FALSE, TRUE, 0.25
FROM ingredients o, ingredients s
WHERE o.name = 'levadura seca' AND s.name = 'buttermilk' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'manteca vegetal' AND s.name = 'aceite vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.33
FROM ingredients o, ingredients s
WHERE o.name = 'manteca vegetal' AND s.name = 'aceite de oliva' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'manteca vegetal' AND s.name = 'aceite de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'manteca vegetal' AND s.name = 'aceite de girasol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9963, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.33
FROM ingredients o, ingredients s
WHERE o.name = 'manteca vegetal' AND s.name = 'margarina vegana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'mantequilla' AND s.name = 'margarina vegana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9962, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.33
FROM ingredients o, ingredients s
WHERE o.name = 'mantequilla' AND s.name = 'aceite vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9962, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.75
FROM ingredients o, ingredients s
WHERE o.name = 'mantequilla' AND s.name = 'aceite de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9962, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.33
FROM ingredients o, ingredients s
WHERE o.name = 'mantequilla' AND s.name = 'aceite de girasol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9962, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'mantequilla' AND s.name = 'manteca vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9993, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.8
FROM ingredients o, ingredients s
WHERE o.name = 'mantequilla de mani' AND s.name = 'harina de almendra' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9936, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.6
FROM ingredients o, ingredients s
WHERE o.name = 'mantequilla de mani' AND s.name = 'semillas de lino' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9784, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'mantequilla de mani' AND s.name = 'nueces molidas' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9278, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.8
FROM ingredients o, ingredients s
WHERE o.name = 'mantequilla de mani' AND s.name = 'margarina vegana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9276, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', FALSE, TRUE, 1.2
FROM ingredients o, ingredients s
WHERE o.name = 'mantequilla de mani' AND s.name = 'mantequilla' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'margarina vegana' AND s.name = 'mantequilla' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9963, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'margarina vegana' AND s.name = 'aceite vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9963, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.12
FROM ingredients o, ingredients s
WHERE o.name = 'margarina vegana' AND s.name = 'aceite de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9963, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'margarina vegana' AND s.name = 'aceite de girasol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9963, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.75
FROM ingredients o, ingredients s
WHERE o.name = 'margarina vegana' AND s.name = 'manteca vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9964, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.17
FROM ingredients o, ingredients s
WHERE o.name = 'miel' AND s.name = 'azucar morena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9956, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.33
FROM ingredients o, ingredients s
WHERE o.name = 'miel' AND s.name = 'panela' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.995, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.15
FROM ingredients o, ingredients s
WHERE o.name = 'miel' AND s.name = 'azucar flor' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9949, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.1
FROM ingredients o, ingredients s
WHERE o.name = 'miel' AND s.name = 'azucar blanca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9923, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.83
FROM ingredients o, ingredients s
WHERE o.name = 'miel' AND s.name = 'datiles molidos' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9837, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.53
FROM ingredients o, ingredients s
WHERE o.name = 'nueces molidas' AND s.name = 'margarina vegana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9835, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.8
FROM ingredients o, ingredients s
WHERE o.name = 'nueces molidas' AND s.name = 'mantequilla' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.982, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.27
FROM ingredients o, ingredients s
WHERE o.name = 'nueces molidas' AND s.name = 'aceite vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.982, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.27
FROM ingredients o, ingredients s
WHERE o.name = 'nueces molidas' AND s.name = 'aceite de girasol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.982, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.4
FROM ingredients o, ingredients s
WHERE o.name = 'nueces molidas' AND s.name = 'manteca vegetal' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9998, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'panela' AND s.name = 'azucar morena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9979, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.5
FROM ingredients o, ingredients s
WHERE o.name = 'panela' AND s.name = 'azucar de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.997, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.3
FROM ingredients o, ingredients s
WHERE o.name = 'panela' AND s.name = 'azucar blanca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9968, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.45
FROM ingredients o, ingredients s
WHERE o.name = 'panela' AND s.name = 'azucar flor' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9956, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 3.0
FROM ingredients o, ingredients s
WHERE o.name = 'panela' AND s.name = 'miel' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9934, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 4.0
FROM ingredients o, ingredients s
WHERE o.name = 'platano maduro' AND s.name = 'gel de chia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9926, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.0
FROM ingredients o, ingredients s
WHERE o.name = 'platano maduro' AND s.name = 'gel de linaza' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9857, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'platano maduro' AND s.name = 'pure de manzana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9773, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.5
FROM ingredients o, ingredients s
WHERE o.name = 'platano maduro' AND s.name = 'tofu sedoso' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9759, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 175.0
FROM ingredients o, ingredients s
WHERE o.name = 'platano maduro' AND s.name = 'huevo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9997, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.25
FROM ingredients o, ingredients s
WHERE o.name = 'polvo de hornear' AND s.name = 'levadura seca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9977, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.62
FROM ingredients o, ingredients s
WHERE o.name = 'polvo de hornear' AND s.name = 'bicarbonato de sodio' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9686, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.75
FROM ingredients o, ingredients s
WHERE o.name = 'polvo de hornear' AND s.name = 'levadura fresca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9525, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor', TRUE, TRUE, 1.88
FROM ingredients o, ingredients s
WHERE o.name = 'polvo de hornear' AND s.name = 'cremor tartaro' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.7196, 'Similar en: contenido graso, nivel de dulzor', FALSE, TRUE, 0.31
FROM ingredients o, ingredients s
WHERE o.name = 'polvo de hornear' AND s.name = 'buttermilk' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9991, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.39
FROM ingredients o, ingredients s
WHERE o.name = 'psyllium husk' AND s.name = 'goma xantana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9987, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.44
FROM ingredients o, ingredients s
WHERE o.name = 'psyllium husk' AND s.name = 'gelatina sin sabor' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9987, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'psyllium husk' AND s.name = 'agar agar' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9372, 'Similar en: aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.22
FROM ingredients o, ingredients s
WHERE o.name = 'psyllium husk' AND s.name = 'almidon de papa' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9272, 'Similar en: aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'psyllium husk' AND s.name = 'harina de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 1.0, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'pure de calabaza' AND s.name = 'pure de zapallo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9925, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'pure de calabaza' AND s.name = 'pure de remolacha' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9923, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.5
FROM ingredients o, ingredients s
WHERE o.name = 'pure de calabaza' AND s.name = 'tofu sedoso' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9888, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'pure de calabaza' AND s.name = 'pure de manzana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9833, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'pure de calabaza' AND s.name = 'yogur natural' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9946, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.67
FROM ingredients o, ingredients s
WHERE o.name = 'pure de manzana' AND s.name = 'tofu sedoso' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9888, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'pure de manzana' AND s.name = 'pure de zapallo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9888, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'pure de manzana' AND s.name = 'pure de calabaza' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9857, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'pure de manzana' AND s.name = 'platano maduro' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9848, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'pure de manzana' AND s.name = 'gel de linaza' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9925, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'pure de remolacha' AND s.name = 'pure de zapallo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9925, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'pure de remolacha' AND s.name = 'pure de calabaza' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9784, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.0
FROM ingredients o, ingredients s
WHERE o.name = 'pure de remolacha' AND s.name = 'yogur vegano' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9703, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.5
FROM ingredients o, ingredients s
WHERE o.name = 'pure de remolacha' AND s.name = 'tofu sedoso' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.97, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'pure de remolacha' AND s.name = 'pure de manzana' AND o.id <> s.id
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
SELECT o.id, s.id, 0.9925, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'pure de zapallo' AND s.name = 'pure de remolacha' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9923, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.5
FROM ingredients o, ingredients s
WHERE o.name = 'pure de zapallo' AND s.name = 'tofu sedoso' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9888, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'pure de zapallo' AND s.name = 'pure de manzana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9833, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'pure de zapallo' AND s.name = 'yogur natural' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8812, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.3
FROM ingredients o, ingredients s
WHERE o.name = 'queso crema' AND s.name = 'crema' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8675, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.35
FROM ingredients o, ingredients s
WHERE o.name = 'queso crema' AND s.name = 'crema de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8316, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.25
FROM ingredients o, ingredients s
WHERE o.name = 'queso crema' AND s.name = 'aguacate' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8268, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.18
FROM ingredients o, ingredients s
WHERE o.name = 'queso crema' AND s.name = 'leche de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8196, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.25
FROM ingredients o, ingredients s
WHERE o.name = 'queso crema' AND s.name = 'crema agria' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9992, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 40.0
FROM ingredients o, ingredients s
WHERE o.name = 'sal' AND s.name = 'cafe soluble' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9937, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 20.0
FROM ingredients o, ingredients s
WHERE o.name = 'sal' AND s.name = 'canela' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9906, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.0
FROM ingredients o, ingredients s
WHERE o.name = 'sal' AND s.name = 'harina de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9858, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 4.0
FROM ingredients o, ingredients s
WHERE o.name = 'sal' AND s.name = 'harina de arroz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9605, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 30.0
FROM ingredients o, ingredients s
WHERE o.name = 'sal' AND s.name = 'cacao en polvo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9957, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.0
FROM ingredients o, ingredients s
WHERE o.name = 'semillas de lino' AND s.name = 'harina de almendra' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9936, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.67
FROM ingredients o, ingredients s
WHERE o.name = 'semillas de lino' AND s.name = 'mantequilla de mani' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9643, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.5
FROM ingredients o, ingredients s
WHERE o.name = 'semillas de lino' AND s.name = 'nueces molidas' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9088, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.33
FROM ingredients o, ingredients s
WHERE o.name = 'semillas de lino' AND s.name = 'margarina vegana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9085, 'Similar en: poder aglutinante, aporte de humedad, nivel de dulzor, capacidad leudante', FALSE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'semillas de lino' AND s.name = 'mantequilla' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9998, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.9
FROM ingredients o, ingredients s
WHERE o.name = 'semola' AND s.name = 'harina de trigo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9851, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'semola' AND s.name = 'avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.985, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.0
FROM ingredients o, ingredients s
WHERE o.name = 'semola' AND s.name = 'harina de avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9663, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'semola' AND s.name = 'harina de arroz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9649, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 3.0
FROM ingredients o, ingredients s
WHERE o.name = 'semola' AND s.name = 'almidon de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9979, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.72
FROM ingredients o, ingredients s
WHERE o.name = 'stevia' AND s.name = 'eritritol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9979, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.8
FROM ingredients o, ingredients s
WHERE o.name = 'stevia' AND s.name = 'xilitol' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9973, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.07
FROM ingredients o, ingredients s
WHERE o.name = 'stevia' AND s.name = 'azucar flor' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9972, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.05
FROM ingredients o, ingredients s
WHERE o.name = 'stevia' AND s.name = 'azucar blanca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.995, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.56
FROM ingredients o, ingredients s
WHERE o.name = 'stevia' AND s.name = 'azucar de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9977, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.6
FROM ingredients o, ingredients s
WHERE o.name = 'tapioca' AND s.name = 'almidon de maiz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9975, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, FALSE, 0.24
FROM ingredients o, ingredients s
WHERE o.name = 'tapioca' AND s.name = 'harina integral' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9874, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.6
FROM ingredients o, ingredients s
WHERE o.name = 'tapioca' AND s.name = 'harina de quinoa' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.967, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.8
FROM ingredients o, ingredients s
WHERE o.name = 'tapioca' AND s.name = 'almidon de papa' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9616, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.8
FROM ingredients o, ingredients s
WHERE o.name = 'tapioca' AND s.name = 'harina de garbanzo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9946, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.6
FROM ingredients o, ingredients s
WHERE o.name = 'tofu sedoso' AND s.name = 'pure de manzana' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9923, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.4
FROM ingredients o, ingredients s
WHERE o.name = 'tofu sedoso' AND s.name = 'pure de zapallo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9923, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.4
FROM ingredients o, ingredients s
WHERE o.name = 'tofu sedoso' AND s.name = 'pure de calabaza' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9884, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.2
FROM ingredients o, ingredients s
WHERE o.name = 'tofu sedoso' AND s.name = 'gel de linaza' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9872, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.6
FROM ingredients o, ingredients s
WHERE o.name = 'tofu sedoso' AND s.name = 'gel de chia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9335, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.08
FROM ingredients o, ingredients s
WHERE o.name = 'vainilla extracto' AND s.name = 'leche de arroz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9045, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.12
FROM ingredients o, ingredients s
WHERE o.name = 'vainilla extracto' AND s.name = 'jugo de limon' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.886, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.04
FROM ingredients o, ingredients s
WHERE o.name = 'vainilla extracto' AND s.name = 'leche descremada' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8823, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.11
FROM ingredients o, ingredients s
WHERE o.name = 'vainilla extracto' AND s.name = 'leche de avena' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.8687, 'Similar en: poder aglutinante, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.1
FROM ingredients o, ingredients s
WHERE o.name = 'vainilla extracto' AND s.name = 'leche de almendra' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9868, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'vinagre blanco' AND s.name = 'jugo de limon' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9419, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.0
FROM ingredients o, ingredients s
WHERE o.name = 'vinagre blanco' AND s.name = 'leche de arroz' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.934, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.25
FROM ingredients o, ingredients s
WHERE o.name = 'vinagre blanco' AND s.name = 'leche de almendra' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.933, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 2.0
FROM ingredients o, ingredients s
WHERE o.name = 'vinagre blanco' AND s.name = 'leche de macadamia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9318, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.4
FROM ingredients o, ingredients s
WHERE o.name = 'vinagre blanco' AND s.name = 'leche de avena' AND o.id <> s.id
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
SELECT o.id, s.id, 0.9979, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.25
FROM ingredients o, ingredients s
WHERE o.name = 'xilitol' AND s.name = 'stevia' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9912, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.7
FROM ingredients o, ingredients s
WHERE o.name = 'xilitol' AND s.name = 'azucar de coco' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9906, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 0.06
FROM ingredients o, ingredients s
WHERE o.name = 'xilitol' AND s.name = 'azucar blanca' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9906, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, capacidad leudante', TRUE, TRUE, 0.09
FROM ingredients o, ingredients s
WHERE o.name = 'xilitol' AND s.name = 'azucar flor' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9891, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.5
FROM ingredients o, ingredients s
WHERE o.name = 'yogur natural' AND s.name = 'yogur vegano' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9861, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'yogur natural' AND s.name = 'aquafaba' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9833, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'yogur natural' AND s.name = 'pure de zapallo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9833, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.5
FROM ingredients o, ingredients s
WHERE o.name = 'yogur natural' AND s.name = 'pure de calabaza' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9831, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 1.25
FROM ingredients o, ingredients s
WHERE o.name = 'yogur natural' AND s.name = 'tofu sedoso' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9891, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', FALSE, TRUE, 0.67
FROM ingredients o, ingredients s
WHERE o.name = 'yogur vegano' AND s.name = 'yogur natural' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9784, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.33
FROM ingredients o, ingredients s
WHERE o.name = 'yogur vegano' AND s.name = 'pure de remolacha' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.978, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.33
FROM ingredients o, ingredients s
WHERE o.name = 'yogur vegano' AND s.name = 'pure de zapallo' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.978, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.33
FROM ingredients o, ingredients s
WHERE o.name = 'yogur vegano' AND s.name = 'pure de calabaza' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;
INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, 0.9609, 'Similar en: poder aglutinante, aporte de humedad, contenido graso, nivel de dulzor, capacidad leudante', TRUE, TRUE, 0.83
FROM ingredients o, ingredients s
WHERE o.name = 'yogur vegano' AND s.name = 'tofu sedoso' AND o.id <> s.id
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