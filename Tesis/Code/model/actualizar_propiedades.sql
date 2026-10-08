-- ACTUALIZAR PROPIEDADES CULINARIAS (matriz objetivizada con datos de composicion)
-- Ejecutar ANTES de import_modelo.sql:
--   docker cp actualizar_propiedades.sql reposteria-db:/tmp/
--   docker exec -i reposteria-db psql -U bruno -d reposteria_db -f /tmp/actualizar_propiedades.sql
-- Compara nombres sin tilde ni mayusculas para no depender de 'azucar' vs 'azúcar'.

BEGIN;

UPDATE ingredients SET moisture=7.9, fat_content=1.0, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'huevo';
UPDATE ingredients SET moisture=9.1, fat_content=0.4, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'gel de linaza';
UPDATE ingredients SET moisture=8.9, fat_content=0.3, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'gel de chia';
UPDATE ingredients SET moisture=9.7, fat_content=0.0, sweetness=0.1 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'aquafaba';
UPDATE ingredients SET moisture=9.1, fat_content=0.0, sweetness=1.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'pure de manzana';
UPDATE ingredients SET moisture=7.7, fat_content=0.0, sweetness=1.2 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'platano maduro';
UPDATE ingredients SET moisture=8.8, fat_content=0.4, sweetness=0.5 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'yogur natural';
UPDATE ingredients SET moisture=8.9, fat_content=0.3, sweetness=0.4 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'yogur vegano';
UPDATE ingredients SET moisture=9.2, fat_content=0.3, sweetness=0.1 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'tofu sedoso';
UPDATE ingredients SET moisture=5.6, fat_content=3.4, sweetness=0.3 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'queso crema';
UPDATE ingredients SET moisture=1.3, fat_content=0.0, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'gelatina sin sabor';
UPDATE ingredients SET moisture=1.2, fat_content=0.0, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'agar agar';
UPDATE ingredients SET moisture=0.9, fat_content=0.1, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'psyllium husk';
UPDATE ingredients SET moisture=1.0, fat_content=0.0, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'goma xantana';
UPDATE ingredients SET moisture=9.4, fat_content=0.0, sweetness=0.3 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'pure de zapallo';
UPDATE ingredients SET moisture=9.1, fat_content=0.0, sweetness=0.7 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'pure de remolacha';
UPDATE ingredients SET moisture=1.1, fat_content=0.1, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'harina de trigo';
UPDATE ingredients SET moisture=1.0, fat_content=0.2, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'harina integral';
UPDATE ingredients SET moisture=0.4, fat_content=5.0, sweetness=0.4 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'harina de almendra';
UPDATE ingredients SET moisture=0.8, fat_content=0.7, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'harina de avena';
UPDATE ingredients SET moisture=1.2, fat_content=0.1, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'harina de arroz';
UPDATE ingredients SET moisture=0.5, fat_content=1.2, sweetness=0.7 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'harina de coco';
UPDATE ingredients SET moisture=1.0, fat_content=0.4, sweetness=0.1 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'harina de maiz';
UPDATE ingredients SET moisture=1.0, fat_content=0.6, sweetness=1.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'harina de garbanzo';
UPDATE ingredients SET moisture=1.0, fat_content=0.6, sweetness=0.2 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'harina de quinoa';
UPDATE ingredients SET moisture=0.8, fat_content=0.0, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'almidon de maiz';
UPDATE ingredients SET moisture=1.8, fat_content=0.0, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'almidon de papa';
UPDATE ingredients SET moisture=1.3, fat_content=0.0, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'tapioca';
UPDATE ingredients SET moisture=1.2, fat_content=0.1, sweetness=0.1 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'semola';
UPDATE ingredients SET moisture=1.6, fat_content=8.1, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'mantequilla';
UPDATE ingredients SET moisture=1.6, fat_content=8.0, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'margarina vegana';
UPDATE ingredients SET moisture=0.0, fat_content=10.0, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'aceite vegetal';
UPDATE ingredients SET moisture=0.0, fat_content=10.0, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'aceite de coco';
UPDATE ingredients SET moisture=0.0, fat_content=10.0, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'aceite de oliva';
UPDATE ingredients SET moisture=0.0, fat_content=10.0, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'manteca vegetal';
UPDATE ingredients SET moisture=6.0, fat_content=3.7, sweetness=0.3 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'crema';
UPDATE ingredients SET moisture=5.6, fat_content=3.4, sweetness=0.3 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'crema de coco';
UPDATE ingredients SET moisture=7.5, fat_content=1.5, sweetness=0.1 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'aguacate';
UPDATE ingredients SET moisture=0.2, fat_content=5.0, sweetness=0.6 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'mantequilla de mani';
UPDATE ingredients SET moisture=0.0, fat_content=10.0, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'aceite de girasol';
UPDATE ingredients SET moisture=0.0, fat_content=0.0, sweetness=10.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'azucar blanca';
UPDATE ingredients SET moisture=0.2, fat_content=0.0, sweetness=9.6 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'azucar morena';
UPDATE ingredients SET moisture=0.1, fat_content=0.0, sweetness=9.9 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'azucar flor';
UPDATE ingredients SET moisture=1.8, fat_content=0.0, sweetness=8.2 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'miel';
UPDATE ingredients SET moisture=3.3, fat_content=0.0, sweetness=6.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'jarabe de maple';
UPDATE ingredients SET moisture=2.4, fat_content=0.0, sweetness=6.8 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'jarabe de agave';
UPDATE ingredients SET moisture=0.2, fat_content=0.0, sweetness=8.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'stevia';
UPDATE ingredients SET moisture=0.0, fat_content=0.0, sweetness=7.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'eritritol';
UPDATE ingredients SET moisture=0.2, fat_content=0.0, sweetness=7.5 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'azucar de coco';
UPDATE ingredients SET moisture=2.2, fat_content=0.0, sweetness=6.4 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'datiles molidos';
UPDATE ingredients SET moisture=0.2, fat_content=0.0, sweetness=9.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'panela';
UPDATE ingredients SET moisture=0.0, fat_content=0.0, sweetness=7.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'xilitol';
UPDATE ingredients SET moisture=9.0, fat_content=0.4, sweetness=0.5 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'leche entera';
UPDATE ingredients SET moisture=9.4, fat_content=0.0, sweetness=0.5 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'leche descremada';
UPDATE ingredients SET moisture=10.0, fat_content=0.1, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'leche de almendra';
UPDATE ingredients SET moisture=7.0, fat_content=2.4, sweetness=0.3 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'leche de coco';
UPDATE ingredients SET moisture=9.3, fat_content=0.2, sweetness=0.4 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'leche de avena';
UPDATE ingredients SET moisture=9.2, fat_content=0.2, sweetness=0.1 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'leche de soya';
UPDATE ingredients SET moisture=9.2, fat_content=0.1, sweetness=0.3 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'leche de arroz';
UPDATE ingredients SET moisture=9.3, fat_content=0.1, sweetness=0.5 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'buttermilk';
UPDATE ingredients SET moisture=2.8, fat_content=0.9, sweetness=5.5 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'leche condensada';
UPDATE ingredients SET moisture=9.9, fat_content=0.3, sweetness=0.1 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'leche de macadamia';
UPDATE ingredients SET moisture=7.3, fat_content=2.0, sweetness=0.4 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'crema agria';
UPDATE ingredients SET moisture=0.5, fat_content=0.0, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'polvo de hornear';
UPDATE ingredients SET moisture=0.0, fat_content=0.0, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'bicarbonato de sodio';
UPDATE ingredients SET moisture=0.5, fat_content=0.2, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'levadura seca';
UPDATE ingredients SET moisture=7.0, fat_content=0.0, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'levadura fresca';
UPDATE ingredients SET moisture=0.0, fat_content=0.0, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'cremor tartaro';
UPDATE ingredients SET moisture=5.5, fat_content=0.0, sweetness=1.3 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'vainilla extracto';
UPDATE ingredients SET moisture=1.1, fat_content=0.1, sweetness=0.2 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'canela';
UPDATE ingredients SET moisture=0.3, fat_content=1.4, sweetness=0.2 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'cacao en polvo';
UPDATE ingredients SET moisture=0.1, fat_content=3.0, sweetness=5.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'chocolate cobertura';
UPDATE ingredients SET moisture=0.1, fat_content=3.2, sweetness=5.9 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'chocolate blanco';
UPDATE ingredients SET moisture=0.3, fat_content=1.4, sweetness=0.2 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'cacao amargo';
UPDATE ingredients SET moisture=0.4, fat_content=0.1, sweetness=3.2 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'algarroba en polvo';
UPDATE ingredients SET moisture=0.0, fat_content=0.0, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'sal';
UPDATE ingredients SET moisture=9.8, fat_content=0.0, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'vinagre blanco';
UPDATE ingredients SET moisture=9.3, fat_content=0.0, sweetness=0.3 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'jugo de limon';
UPDATE ingredients SET moisture=0.4, fat_content=0.0, sweetness=0.0 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'cafe soluble';
UPDATE ingredients SET moisture=0.4, fat_content=6.5, sweetness=0.3 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'nueces molidas';
UPDATE ingredients SET moisture=0.8, fat_content=0.7, sweetness=0.1 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'avena';
UPDATE ingredients SET moisture=0.7, fat_content=4.2, sweetness=0.2 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'semillas de lino';
UPDATE ingredients SET moisture=9.4, fat_content=0.0, sweetness=0.3 WHERE translate(lower(name), 'áéíóúñ', 'aeioun') = 'pure de calabaza';

-- Control: ingredientes cuyo nombre aparece mas de una vez (duplicados por tildes)
SELECT translate(lower(name), 'áéíóúñ', 'aeioun') AS nombre_normalizado, COUNT(*)
FROM ingredients GROUP BY 1 HAVING COUNT(*) > 1;

COMMIT;