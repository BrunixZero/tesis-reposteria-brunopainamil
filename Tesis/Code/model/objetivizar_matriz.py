"""
OBJETIVIZACION DE LA MATRIZ HEURISTICA CON DATOS DE COMPOSICION NUTRICIONAL
===========================================================================
Reemplaza la asignacion subjetiva de moisture, fat_content y sweetness por
valores derivados de composicion real (g de agua, grasa y azucares por 100 g),
reescalados a 0-10. binding_power y leavening se mantienen como criterio
experto: son propiedades FUNCIONALES y no existe una columna nutricional que
las mida.

TRANSPARENCIA DE FUENTES (importante para la defensa):
  Nivel A = valor leido directamente de una ficha publica de composicion
            (USDA FoodData Central / Wikipedia con cita USDA) durante este trabajo.
  Nivel B = valor de referencia estandar de composicion, aun NO confirmado
            ficha por ficha. Antes de entregar el informe final, confirma cada
            uno en https://fdc.nal.usda.gov/food-search (categorias "SR Legacy"
            o "Foundation", no "Branded") y cambialo a nivel A.

Uso:
    python3 objetivizar_matriz.py datos_extraidos.py
"""
import sys
import numpy as np
import pandas as pd

ruta_datos = sys.argv[1] if len(sys.argv) > 1 else "datos_extraidos.py"
ns = {}
exec(open(ruta_datos).read(), ns)
cols = ['nombre', 'binding_power', 'moisture', 'fat_content', 'sweetness',
        'leavening', 'is_vegan', 'is_gluten_free', 'precio_clp']
df = pd.DataFrame(ns['datos'], columns=cols).set_index('nombre')

# (agua_g, grasa_g, azucares_g) por 100 g
COMPOSICION = {
    # --- proteicos / aglutinantes
    'huevo': (76.2, 9.5, 0.4), 'gel de linaza': (88.0, 4.0, 0.2),
    'gel de chia': (86.0, 3.0, 0.2), 'aquafaba': (94.0, 0.0, 0.5),
    'pure de manzana': (88.0, 0.2, 10.0), 'platano maduro': (75.0, 0.3, 12.0),
    'yogur natural': (85.0, 3.5, 4.7), 'yogur vegano': (86.0, 3.0, 4.0),
    'tofu sedoso': (89.0, 3.0, 0.6), 'queso crema': (54.0, 34.0, 3.2),
    'gelatina sin sabor': (13.0, 0.1, 0.0), 'agar agar': (12.0, 0.3, 0.0),
    'psyllium husk': (9.0, 0.6, 0.0), 'goma xantana': (10.0, 0.0, 0.0),
    'pure de zapallo': (91.0, 0.1, 2.8), 'pure de remolacha': (88.0, 0.2, 7.0),
    'pure de calabaza': (91.0, 0.1, 2.8),
    # --- harinas y almidones
    'harina de trigo': (11.0, 1.0, 0.3), 'harina integral': (10.0, 2.5, 0.4),
    'harina de almendra': (4.0, 50.0, 4.4), 'harina de avena': (8.0, 7.0, 0.0),
    'harina de arroz': (12.0, 1.4, 0.1), 'harina de coco': (5.0, 12.0, 7.0),
    'harina de maiz': (10.0, 3.5, 0.5), 'harina de garbanzo': (10.0, 6.0, 10.0),
    'harina de quinoa': (10.0, 6.0, 2.0), 'almidon de maiz': (8.0, 0.1, 0.0),
    'almidon de papa': (17.0, 0.0, 0.0), 'tapioca': (13.0, 0.0, 0.0),
    'semola': (12.0, 1.0, 0.7), 'avena': (8.0, 6.9, 0.9),
    # --- grasas
    'mantequilla': (16.0, 81.0, 0.1), 'margarina vegana': (16.0, 80.0, 0.1),
    'aceite vegetal': (0.0, 100.0, 0.0), 'aceite de coco': (0.0, 100.0, 0.0),
    'aceite de oliva': (0.0, 100.0, 0.0), 'manteca vegetal': (0.0, 100.0, 0.0),
    'aceite de girasol': (0.0, 100.0, 0.0), 'crema': (58.0, 37.0, 3.4),
    'crema de coco': (54.0, 34.0, 3.3), 'aguacate': (73.0, 15.0, 0.7),
    'mantequilla de mani': (1.5, 50.0, 6.0), 'crema agria': (71.0, 20.0, 3.5),
    'semillas de lino': (7.0, 42.0, 1.6), 'nueces molidas': (4.0, 65.0, 2.6),
    # --- endulzantes
    'azucar blanca': (0.1, 0.0, 99.8), 'azucar morena': (1.8, 0.0, 96.2),
    'azucar flor': (0.5, 0.0, 99.0), 'miel': (17.0, 0.0, 82.1),
    'jarabe de maple': (32.0, 0.0, 60.0), 'jarabe de agave': (22.9, 0.5, 68.0),
    'stevia': (2.0, 0.0, 0.0), 'eritritol': (0.0, 0.0, 0.0),
    'azucar de coco': (1.5, 0.0, 75.0), 'datiles molidos': (21.0, 0.4, 64.0),
    'panela': (2.0, 0.0, 90.0), 'xilitol': (0.0, 0.0, 0.0),
    # --- lacteos y alternativas liquidas
    'leche entera': (87.7, 3.6, 5.1), 'leche descremada': (90.8, 0.2, 5.1),
    'leche de almendra': (97.0, 1.1, 0.4), 'leche de coco': (68.0, 24.0, 3.3),
    'leche de avena': (90.0, 1.5, 4.0), 'leche de soya': (89.0, 1.8, 1.0),
    'leche de arroz': (89.0, 1.0, 3.0), 'buttermilk': (90.0, 0.9, 4.8),
    'leche condensada': (27.0, 8.7, 55.0), 'leche de macadamia': (96.0, 3.0, 0.5),
    # --- leudantes y otros
    'polvo de hornear': (5.0, 0.0, 0.0), 'bicarbonato de sodio': (0.0, 0.0, 0.0),
    'levadura seca': (5.0, 1.9, 0.0), 'levadura fresca': (68.0, 0.4, 0.0),
    'cremor tartaro': (0.0, 0.0, 0.0), 'vainilla extracto': (53.0, 0.1, 12.6),
    'canela': (10.6, 1.2, 2.2), 'cacao en polvo': (3.0, 13.7, 1.8),
    'chocolate cobertura': (1.0, 30.0, 50.0), 'chocolate blanco': (1.0, 32.0, 59.0),
    'cacao amargo': (3.0, 13.7, 1.8), 'algarroba en polvo': (4.0, 1.4, 32.0),
    'sal': (0.2, 0.0, 0.0), 'vinagre blanco': (94.8, 0.0, 0.0),
    'jugo de limon': (90.0, 0.2, 2.5), 'cafe soluble': (4.0, 0.2, 0.0),
}

# Valores leidos de fichas publicas (USDA via fuentes citadas) en este trabajo
NIVEL_A = {'azucar morena', 'jarabe de agave', 'harina de garbanzo'}

# Endulzantes cuya dulzura NO proviene de azucares: medir sweetness con % de
# azucares los dejaria en 0 (falso). Conservan el valor heuristico original
# hasta reemplazarlo por el indice de dulzor relativo a sacarosa de la literatura.
SWEETNESS_NO_AZUCAR = {'stevia', 'eritritol', 'xilitol'}

faltan = [i for i in df.index if i not in COMPOSICION]
sobran = [i for i in COMPOSICION if i not in df.index]
print(f"Cobertura: {len(df) - len(faltan)}/{len(df)} ingredientes")
print("Sin dato:", faltan)
print("En la tabla pero no en el dataset:", sobran)


def a_escala_0_10(serie):
    mn, mx = serie.min(), serie.max()
    return ((serie - mn) / (mx - mn) * 10).round(1)


comp = pd.DataFrame(COMPOSICION, index=['agua', 'grasa', 'azucar']).T
comp = comp.loc[[i for i in df.index if i in comp.index]]

hib = df.copy()
hib[['moisture', 'fat_content', 'sweetness']] = hib[['moisture', 'fat_content', 'sweetness']].astype(float)
hib.loc[comp.index, 'moisture'] = a_escala_0_10(comp['agua'])
hib.loc[comp.index, 'fat_content'] = a_escala_0_10(comp['grasa'])
dulce = a_escala_0_10(comp['azucar'])
for nombre in comp.index:
    if nombre not in SWEETNESS_NO_AZUCAR:
        hib.loc[nombre, 'sweetness'] = dulce[nombre]

hib['fuente_composicion'] = ['A' if i in NIVEL_A else ('B' if i in comp.index else 'heuristico')
                             for i in hib.index]
hib.to_csv('matriz_hibrida_usda.csv')
print("\nGuardado matriz_hibrida_usda.csv")
print(hib['fuente_composicion'].value_counts().to_string())
