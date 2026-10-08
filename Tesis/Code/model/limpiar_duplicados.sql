-- LIMPIAR INGREDIENTES DUPLICADOS (copias con tilde que no se usan en recetas ni cotizaciones)
-- Conserva las copias sin tilde (las que usa import_modelo.sql) y borra las 4 con tilde:
--   azúcar flor, azúcar morena, plátano maduro, puré de manzana
-- Ejecutar ANTES de import_modelo.sql:
--   docker cp limpiar_duplicados.sql reposteria-db:/tmp/
--   docker exec -i reposteria-db psql -U bruno -d reposteria_db -f /tmp/limpiar_duplicados.sql
--
-- Seguridad: solo borra ingredientes que (a) tienen tilde en el nombre, (b) coinciden con
-- los 4 nombres y (c) NO aparecen en recipe_ingredients ni en quote_items.

BEGIN;

-- 1. Sustitutos que apuntan a las copias con tilde (se regeneran con el import)
DELETE FROM substitutes
WHERE original_id IN (
        SELECT id FROM ingredients
        WHERE name <> translate(name, 'áéíóúñ', 'aeioun')
          AND translate(lower(name), 'áéíóúñ', 'aeioun') IN ('azucar flor','azucar morena','platano maduro','pure de manzana'))
   OR substitute_id IN (
        SELECT id FROM ingredients
        WHERE name <> translate(name, 'áéíóúñ', 'aeioun')
          AND translate(lower(name), 'áéíóúñ', 'aeioun') IN ('azucar flor','azucar morena','platano maduro','pure de manzana'));

-- 2. Borrar las copias con tilde sin uso
DELETE FROM ingredients i
WHERE i.name <> translate(i.name, 'áéíóúñ', 'aeioun')
  AND translate(lower(i.name), 'áéíóúñ', 'aeioun') IN ('azucar flor','azucar morena','platano maduro','pure de manzana')
  AND NOT EXISTS (SELECT 1 FROM recipe_ingredients r WHERE r.ingredient_id = i.id)
  AND NOT EXISTS (SELECT 1 FROM quote_items q WHERE q.ingredient_id = i.id);

-- 3. Control: debe quedar vacio (0 rows)
SELECT translate(lower(name), 'áéíóúñ', 'aeioun') AS nombre_normalizado, COUNT(*)
FROM ingredients GROUP BY 1 HAVING COUNT(*) > 1;

COMMIT;
