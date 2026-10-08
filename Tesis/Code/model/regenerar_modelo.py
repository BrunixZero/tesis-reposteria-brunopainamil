import pandas as pd
import numpy as np

datos = [
    # nombre,                  bind, moist, fat, sweet, leav, vegan, gf,   clp
    # AGLUTINANTES
    ('huevo',                    9,  7,  5,  0,  1,  0,  1,  350),
    ('gel de linaza',            8,  6,  3,  0,  0,  1,  1,    6),
    ('gel de chia',              8,  7,  2,  0,  0,  1,  1,    8),
    ('aquafaba',                 7,  8,  0,  0,  2,  1,  1,    2),
    ('pure de manzana',          6,  8,  0,  4,  0,  1,  1,    3),
    ('platano maduro',           7,  8,  0,  5,  0,  1,  1,    2),
    ('yogur natural',            5,  7,  2,  1,  1,  0,  1,    4),
    ('yogur vegano',             4,  7,  1,  1,  1,  1,  1,    6),
    ('tofu sedoso',              6,  6,  2,  0,  0,  1,  1,    5),
    ('queso crema',              3,  4,  8,  1,  0,  0,  1,   20),
    ('gelatina sin sabor',       7,  3,  0,  0,  0,  0,  1,    8),
    ('agar agar',                7,  3,  0,  0,  0,  1,  1,   12),
    ('psyllium husk',            8,  5,  0,  0,  0,  1,  1,   18),
    ('goma xantana',             9,  2,  0,  0,  0,  1,  1,   25),
    ('pure de zapallo',          5,  8,  0,  3,  0,  1,  1,    2),
    ('pure de remolacha',        4,  8,  0,  3,  0,  1,  1,    2),
    # HARINAS Y ALMIDONES
    ('harina de trigo',          2,  1,  0,  0,  0,  1,  0,  0.9),
    ('harina integral',          3,  2,  1,  0,  0,  1,  0,  1.2),
    ('harina de almendra',       3,  3,  6,  1,  0,  1,  1,   18),
    ('harina de avena',          2,  2,  1,  1,  0,  1,  1,    3),
    ('harina de arroz',          1,  1,  0,  0,  0,  1,  1,    2),
    ('harina de coco',           4,  2,  4,  2,  0,  1,  1,   12),
    ('harina de maiz',           1,  1,  0,  1,  0,  1,  1,  1.5),
    ('harina de garbanzo',       3,  2,  1,  1,  0,  1,  1,    4),
    ('harina de quinoa',         3,  2,  2,  0,  0,  1,  1,    8),
    ('almidon de maiz',          3,  0,  0,  0,  0,  1,  1,    3),
    ('almidon de papa',          4,  0,  0,  0,  0,  1,  1,    4),
    ('tapioca',                  3,  1,  0,  0,  0,  1,  1,    5),
    ('semola',                   2,  1,  0,  0,  0,  1,  0,  1.0),
    # GRASAS
    ('mantequilla',              1,  2, 10,  0,  0,  0,  1,   12),
    ('margarina vegana',         1,  2,  9,  0,  0,  1,  1,    8),
    ('aceite vegetal',           0,  2, 10,  0,  0,  1,  1,    4),
    ('aceite de coco',           0,  1, 10,  1,  0,  1,  1,    9),
    ('aceite de oliva',          0,  2,  9,  0,  0,  1,  1,    8),
    ('manteca vegetal',          0,  1, 10,  0,  0,  1,  1,    6),
    ('crema',                    1,  6,  8,  1,  0,  0,  1,    6),
    ('crema de coco',            1,  5,  8,  2,  0,  1,  1,    7),
    ('aguacate',                 2,  4,  7,  0,  0,  1,  1,    5),
    ('mantequilla de mani',      3,  2,  8,  2,  0,  1,  1,   10),
    ('aceite de girasol',        0,  2, 10,  0,  0,  1,  1,    4),
    # AZUCARES Y ENDULZANTES
    ('azucar blanca',            0,  0,  0, 10,  0,  1,  1,  1.2),
    ('azucar morena',            1,  2,  0,  9,  0,  1,  1,  2.0),
    ('azucar flor',              0,  0,  0, 10,  0,  1,  1,  1.8),
    ('miel',                     1,  3,  0,  9,  0,  0,  1,   12),
    ('jarabe de maple',          1,  3,  0,  8,  0,  1,  1,   20),
    ('jarabe de agave',          0,  3,  0,  8,  0,  1,  1,   15),
    ('stevia',                   0,  0,  0,  8,  0,  1,  1,   25),
    ('eritritol',                0,  0,  0,  7,  0,  1,  1,   18),
    ('azucar de coco',           1,  1,  0,  7,  0,  1,  1,   14),
    ('datiles molidos',          2,  3,  0,  8,  0,  1,  1,   10),
    ('panela',                   1,  2,  0,  9,  0,  1,  1,    4),
    ('xilitol',                  0,  0,  0,  7,  0,  1,  1,   20),
    # LACTEOS Y ALTERNATIVAS
    ('leche entera',             2,  9,  3,  2,  0,  0,  1,  1.1),
    ('leche descremada',         1,  9,  1,  2,  0,  0,  1,  0.9),
    ('leche de almendra',        1,  9,  1,  1,  0,  1,  1,  2.5),
    ('leche de coco',            1,  7,  5,  2,  0,  1,  1,  3.5),
    ('leche de avena',           1,  9,  1,  2,  0,  1,  1,  2.8),
    ('leche de soya',            2,  9,  2,  1,  0,  1,  1,  2.2),
    ('leche de arroz',           0,  9,  0,  2,  0,  1,  1,  2.0),
    ('buttermilk',               3,  9,  2,  1,  3,  0,  1,  2.5),
    ('leche condensada',         1,  5,  3, 10,  0,  0,  1,  8.0),
    ('leche de macadamia',       1,  8,  2,  1,  0,  1,  1,  4.0),
    ('crema agria',              2,  6,  5,  1,  1,  0,  1,  5.0),
    # LEUDANTES
    ('polvo de hornear',         0,  0,  0,  0, 10,  1,  1,    8),
    ('bicarbonato de sodio',     0,  0,  0,  0,  8,  1,  1,    5),
    ('levadura seca',            0,  0,  0,  0,  9,  1,  1,   10),
    ('levadura fresca',          0,  1,  0,  0, 10,  1,  1,    6),
    ('cremor tartaro',           0,  0,  0,  0,  4,  1,  1,   15),
    # SABORIZANTES
    ('vainilla extracto',        0,  1,  0,  1,  0,  1,  1,   25),
    ('canela',                   0,  0,  0,  2,  0,  1,  1,   10),
    ('cacao en polvo',           1,  0,  3,  3,  0,  1,  1,   15),
    ('chocolate cobertura',      1,  0,  6,  8,  0,  1,  1,   18),
    ('chocolate blanco',         0,  0,  7,  9,  0,  0,  1,   20),
    ('cacao amargo',             1,  0,  4,  1,  0,  1,  1,   22),
    ('algarroba en polvo',       1,  0,  1,  4,  0,  1,  1,   12),
    # OTROS
    ('sal',                      0,  0,  0,  0,  0,  1,  1,  0.5),
    ('vinagre blanco',           0,  2,  0,  0,  2,  1,  1,    2),
    ('jugo de limon',            0,  3,  0,  1,  1,  1,  1,    3),
    ('cafe soluble',             0,  2,  0,  0,  0,  1,  1,   20),
    ('nueces molidas',           2,  1,  7,  0,  0,  1,  1,   15),
    ('avena',                    2,  3,  2,  1,  0,  1,  1,    2),
    ('semillas de lino',         3,  2,  4,  0,  0,  1,  1,    6),
    ('pure de calabaza',         5,  8,  0,  3,  0,  1,  1,    2),
]

cols = ['nombre','binding_power','moisture','fat_content','sweetness',
        'leavening','is_vegan','is_gluten_free','precio_clp']
df = pd.DataFrame(datos, columns=cols).set_index('nombre')


# === MATRIZ OBJETIVIZADA: reemplaza moisture/fat_content/sweetness por la version con datos de composicion ===
import sys
_hib = pd.read_csv(sys.argv[1]).set_index('nombre')
for _c in ['moisture', 'fat_content', 'sweetness']:
    df[_c] = _hib.loc[df.index, _c].astype(float)
print(f"Matriz objetivizada aplicada a {len(df)} ingredientes")

from sklearn.preprocessing import StandardScaler
from sklearn.neighbors import NearestNeighbors

features = ['binding_power','moisture','fat_content','sweetness','leavening']
X = df[features].values

scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)

k = min(10, len(df))
knn = NearestNeighbors(n_neighbors=k, metric='cosine', algorithm='brute')
knn.fit(X_scaled)

print(f'Modelo KNN entrenado')
print(f'  Ingredientes: {len(df)}')
print(f'  Features: {features}')
print(f'  Metrica: coseno')
print(f'  k vecinos: {k}')


def similitud_score(dist_coseno):
    return round(1 - dist_coseno / 2, 4)

def generar_razon(orig, sust):
    props = {
        'binding_power': 'poder aglutinante',
        'moisture':      'aporte de humedad',
        'fat_content':   'contenido graso',
        'sweetness':     'nivel de dulzor',
        'leavening':     'capacidad leudante',
    }
    similares = [desc for col, desc in props.items()
                 if abs(orig[col] - sust[col]) <= 2]
    return ('Similar en: ' + ', '.join(similares)) if similares else 'Propiedades culinarias comparables'

def recomendar_sustitutos(ingrediente, n=5, solo_vegano=False, solo_sin_gluten=False, verbose=True):
    if ingrediente not in df.index:
        print(f'ERROR: "{ingrediente}" no esta en el dataset')
        return []

    idx = df.index.get_loc(ingrediente)
    vec = X_scaled[idx].reshape(1, -1)
    dists, idxs = knn.kneighbors(vec)

    resultados = []
    for i in range(len(idxs[0])):
        if idxs[0][i] == idx:   # excluir al propio ingrediente por INDICE, no por posicion (hay empates a distancia 0)
            continue
        nombre_sust = df.index[idxs[0][i]]
        dist = dists[0][i]
        score = similitud_score(dist)
        row_sust = df.loc[nombre_sust]
        row_orig = df.loc[ingrediente]

        es_vegano = bool(row_sust['is_vegan'])
        es_gf = bool(row_sust['is_gluten_free'])

        if solo_vegano and not es_vegano: continue
        if solo_sin_gluten and not es_gf: continue
        if score < 0.05: continue

        precio_orig = df.loc[ingrediente, 'precio_clp']
        precio_sust = row_sust['precio_clp']
        cost_ratio = round(precio_sust / precio_orig, 2) if precio_orig > 0 else 1.0

        resultados.append({
            'original':         ingrediente,
            'sustituto':        nombre_sust,
            'similarity_score': score,
            'reason':           generar_razon(row_orig, row_sust),
            'vegan_safe':       es_vegano,
            'gluten_free_safe': es_gf,
            'cost_ratio':       cost_ratio,
        })
        if len(resultados) >= n:
            break

    if verbose and resultados:
        filtros = []
        if solo_vegano: filtros.append('vegano')
        if solo_sin_gluten: filtros.append('sin gluten')
        tag = f" [{', '.join(filtros)}]" if filtros else ''
        print(f"\nSustitutos para '{ingrediente}'{tag}")
        print('-' * 65)
        for r in resultados:
            costo_str = ('mas barato' if r['cost_ratio'] < 0.95
                        else 'mas caro' if r['cost_ratio'] > 1.05
                        else 'precio similar')
            flags = []
            if r['vegan_safe']: flags.append('vegano')
            if r['gluten_free_safe']: flags.append('sin gluten')
            print(f"  {r['sustituto']:<28} {r['similarity_score']*100:5.1f}%  "
                  f"{costo_str:<14}  " + "  ".join(flags))
            print(f"    {r['reason']}")
    return resultados


# --- CSV sustitutos ---
print('Generando tabla completa de sustitutos...')
registros = []
for ingrediente in df.index:
    subs = recomendar_sustitutos(ingrediente, n=5, verbose=False)
    for s in subs:
        if s['similarity_score'] >= 0.10:
            registros.append(s)

df_sust = pd.DataFrame(registros)
df_sust = df_sust.rename(columns={'original':'original_nombre','sustituto':'substitute_nombre'})
df_sust = df_sust.sort_values(['original_nombre','similarity_score'], ascending=[True,False])
assert (df_sust.original_nombre != df_sust.substitute_nombre).all(), 'hay autopares (un ingrediente como su propio sustituto)'
df_sust.to_csv('sustitutos_modelo_knn.csv', index=False)

print(f'{len(df_sust)} pares de sustitutos generados para {df_sust.original_nombre.nunique()} ingredientes')
print()
print('HUEVO - sustitutos:')
print(df_sust[df_sust.original_nombre=='huevo'][['substitute_nombre','similarity_score','vegan_safe','gluten_free_safe']].to_string(index=False))
print()
print('HARINA DE TRIGO - sin gluten:')
m = (df_sust.original_nombre=='harina de trigo') & (df_sust.gluten_free_safe==True)
print(df_sust[m][['substitute_nombre','similarity_score']].to_string(index=False))

# --- CSV ingredientes ---
df_ing = df.reset_index()
df_ing.columns = ['name','binding_power','moisture','fat_content','sweetness',
                   'leavening','is_vegan','is_gluten_free','price_per_unit']

def asignar_unidad(nombre):
    liquidos = ['aceite','leche','crema','extracto','vainilla','vinagre','jugo','buttermilk','aquafaba']
    if any(x in nombre for x in liquidos): return 'ml'
    if nombre == 'huevo': return 'unidad'
    return 'g'

df_ing['default_unit'] = df_ing['name'].apply(asignar_unidad)
df_ing['unit_label'] = df_ing['default_unit']
df_ing.to_csv('ingredientes_expandidos.csv', index=False)

# --- SQL de importacion ---
lines = [
    '-- IMPORTACION MODELO KNN',
    '-- Ejecutar: Get-Content import_modelo.sql | docker exec -i reposteria-db psql -U bruno -d reposteria_db',
    '',
    'BEGIN;',
    '',
    '-- 1. Limpiar sustitutos manuales',
    'DELETE FROM substitutes;',
    '',
    '-- 2. Insertar ingredientes nuevos',
]

for _, row in df_ing.iterrows():
    name = row['name'].replace("'", "''")
    lines.append(f"""INSERT INTO ingredients (name, default_unit, binding_power, moisture, fat_content, sweetness, leavening, is_vegan, is_gluten_free, price_per_unit, unit_label)
SELECT '{name}', '{row.default_unit}', {row.binding_power}, {row.moisture}, {row.fat_content}, {row.sweetness}, {row.leavening}, {str(bool(row.is_vegan)).upper()}, {str(bool(row.is_gluten_free)).upper()}, {row.price_per_unit}, '{row.unit_label}'
WHERE NOT EXISTS (SELECT 1 FROM ingredients WHERE name = '{name}');""")

lines += ['', '-- 3. Insertar pares de sustitutos del modelo KNN']

for _, row in df_sust.iterrows():
    orig   = row['original_nombre'].replace("'", "''")
    sust   = row['substitute_nombre'].replace("'", "''")
    score  = row['similarity_score']
    reason = str(row['reason']).replace("'", "''")
    vegan  = str(bool(row['vegan_safe'])).upper()
    gf     = str(bool(row['gluten_free_safe'])).upper()
    cr     = row['cost_ratio']
    lines.append(f"""INSERT INTO substitutes (original_id, substitute_id, similarity_score, reason, vegan_safe, gluten_free_safe, cost_ratio)
SELECT o.id, s.id, {score}, '{reason}', {vegan}, {gf}, {cr}
FROM ingredients o, ingredients s
WHERE o.name = '{orig}' AND s.name = '{sust}' AND o.id <> s.id
ON CONFLICT (original_id, substitute_id) DO UPDATE
    SET similarity_score=EXCLUDED.similarity_score, reason=EXCLUDED.reason,
        vegan_safe=EXCLUDED.vegan_safe, gluten_free_safe=EXCLUDED.gluten_free_safe, cost_ratio=EXCLUDED.cost_ratio;""")

lines += [
    '',
    'COMMIT;',
    '',
    "SELECT COUNT(*) AS total_sustitutos FROM substitutes;",
    "SELECT i.name AS original, s2.name AS sustituto, s.similarity_score, s.vegan_safe, s.gluten_free_safe",
    "FROM substitutes s",
    "JOIN ingredients i  ON i.id  = s.original_id",
    "JOIN ingredients s2 ON s2.id = s.substitute_id",
    "WHERE i.name = 'huevo'",
    "ORDER BY s.similarity_score DESC;",
]

with open('import_modelo.sql', 'w', encoding='utf-8') as f:
    f.write('\n'.join(lines))

print()
print('Archivos generados:')
print(f'  sustitutos_modelo_knn.csv   — {len(df_sust)} pares')
print(f'  ingredientes_expandidos.csv — {len(df_ing)} ingredientes')
print('  import_modelo.sql           — script SQL listo para ejecutar')


