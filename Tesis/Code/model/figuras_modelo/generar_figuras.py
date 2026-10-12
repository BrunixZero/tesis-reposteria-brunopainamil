"""
FIGURAS DEL MODELO PARA EL INFORME FINAL
Uso:  python3 generar_figuras.py datos_extraidos.py matriz_hibrida_usda.csv [carpeta_salida]
Genera 5 PNG (300 dpi, fondo blanco, listos para Word/PDF):
  fig1_distribucion_propiedades.png   original vs objetivizada, 5 propiedades
  fig2_pca_ingredientes.png           espacio vectorial (PCA 2D) de la matriz objetivizada
  fig3_matriz_similitud.png           similitud coseno entre los 83 ingredientes, ordenada por categoria
  fig4_comparacion_metricas.png       precision@k y MRR: original vs objetivizada
  fig5_rango_por_par.png              posicion del sustituto verificado en cada uno de los 18 pares
"""
import os, re, sys
import numpy as np, pandas as pd
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.colors import LinearSegmentedColormap
from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler
from sklearn.metrics.pairwise import cosine_similarity
from adjustText import adjust_text

ruta_datos, ruta_hib = sys.argv[1], sys.argv[2]
OUT = sys.argv[3] if len(sys.argv) > 3 else "figuras"
os.makedirs(OUT, exist_ok=True)

# ---------- paleta (dataviz: slots 1-2 categoricos, gris de contexto) ----------
AZUL, NARANJA, AQUA = "#2a78d6", "#eb6834", "#1baf7a"
INK, INK2, GRID, GRIS = "#0b0b0b", "#52514e", "#e6e5e1", "#b8b7b0"
plt.rcParams.update({
    "font.family": "DejaVu Sans", "font.size": 10, "axes.edgecolor": GRIS, "axes.labelcolor": INK2,
    "xtick.color": INK2, "ytick.color": INK2, "text.color": INK, "axes.spines.top": False,
    "axes.spines.right": False, "figure.facecolor": "white", "axes.facecolor": "white",
    "savefig.dpi": 300, "savefig.bbox": "tight", "savefig.facecolor": "white"})

F = ['binding_power', 'moisture', 'fat_content', 'sweetness', 'leavening']
ETQ = {'binding_power': 'Poder aglutinante', 'moisture': 'Humedad', 'fat_content': 'Contenido graso',
       'sweetness': 'Dulzor', 'leavening': 'Capacidad leudante'}
COMPOSICION = {'moisture', 'fat_content', 'sweetness'}   # las 3 propiedades objetivizadas

# ---------- datos ----------
src = open(ruta_datos, encoding="utf-8").read()
ns = {}; exec(src, ns)
cols = ['nombre'] + F + ['is_vegan', 'is_gluten_free', 'precio_clp']
orig = pd.DataFrame(ns['datos'], columns=cols).set_index('nombre')
hib = pd.read_csv(ruta_hib).set_index('nombre')
orig = orig.loc[hib.index]

# categoria de cada ingrediente = encabezado de comentario que lo precede en datos_extraidos.py
cat, actual = {}, None
for ln in src.splitlines():
    m = re.match(r"\s*#\s*([A-ZÁÉÍÓÚÑ ]{4,})\s*$", ln)
    if m: actual = m.group(1).strip().title(); continue
    m = re.match(r"\s*\('([^']+)'", ln)
    if m and actual: cat[m.group(1)] = actual
hib['cat'] = [cat.get(n, 'Otros') for n in hib.index]
ORDEN_CAT = ['Aglutinantes', 'Harinas Y Almidones', 'Grasas', 'Azucares Y Endulzantes',
             'Lacteos Y Alternativas', 'Leudantes', 'Saborizantes', 'Otros']
NOMBRE_CAT = {'Aglutinantes': 'Aglutinantes', 'Harinas Y Almidones': 'Harinas y almidones', 'Grasas': 'Grasas',
              'Azucares Y Endulzantes': 'Endulzantes', 'Lacteos Y Alternativas': 'Lácteos y alternativas',
              'Leudantes': 'Leudantes', 'Saborizantes': 'Saborizantes', 'Otros': 'Otros'}

import textwrap
def pie(fig, texto, y=-0.04):
    ancho = int(fig.get_size_inches()[0] * 11.5)
    fig.text(0.01, y, "\n".join(textwrap.wrap(texto, ancho)), fontsize=8, color=INK2, ha="left", va="top")

# =====================================================================
# FIG 1 - distribucion de propiedades: original (gris) vs objetivizada (azul)
# =====================================================================
fig, axs = plt.subplots(1, 5, figsize=(15, 3.4), sharey=True)
bins = np.linspace(0, 10, 11)
for ax, f in zip(axs, F):
    cambia = f in COMPOSICION
    ax.hist(orig[f], bins=bins, color=GRIS, alpha=1, rwidth=0.82,
            label="Original (asignada a criterio)")
    if cambia:
        ax.hist(hib[f], bins=bins, histtype="step", color=AZUL, linewidth=2.2, label="Objetivizada (composición)")
    ax.set_title(ETQ[f], fontsize=11, fontweight="bold", loc="left")
    ax.set_xlabel("Escala 0–10")
    ax.set_xticks(range(0, 11, 2)); ax.grid(axis="y", color=GRID, linewidth=0.8); ax.set_axisbelow(True)
    ax.text(0.97, 0.93, "datos de composición" if cambia else "sin cambios (criterio experto)",
            transform=ax.transAxes, ha="right", va="top", fontsize=8, color=INK2)
axs[0].set_ylabel("N.º de ingredientes")
h = [plt.Rectangle((0, 0), 1, 1, color=GRIS), plt.Line2D([0], [0], color=AZUL, lw=2.2)]
fig.legend(h, ["Original (asignada a criterio)", "Objetivizada (a partir de composición nutricional)"],
           loc="upper center", ncol=2, frameon=False, bbox_to_anchor=(0.5, 1.08))
pie(fig, "n = 83 ingredientes. Humedad, grasa y dulzor se recalcularon desde agua, grasa y azúcares por 100 g; "
         "poder aglutinante y capacidad leudante son propiedades funcionales y se mantienen.")
fig.savefig(f"{OUT}/fig1_distribucion_propiedades.png"); plt.close(fig)

# =====================================================================
# FIG 2 - PCA de la matriz objetivizada
# =====================================================================
Xs = StandardScaler().fit_transform(hib[F].values.astype(float))
pca = PCA(n_components=2).fit(Xs); Z = pca.transform(Xs); ev = pca.explained_variance_ratio_ * 100
RESALTAR = {'Aglutinantes': AZUL, 'Harinas Y Almidones': AQUA, 'Azucares Y Endulzantes': NARANJA}
fig, ax = plt.subplots(figsize=(11, 7.4))
gris = ~hib['cat'].isin(RESALTAR)
ax.scatter(Z[gris, 0], Z[gris, 1], s=46, color=GRIS, edgecolor="white", linewidth=1.2, label="Otras categorías", zorder=2)
for c, col in RESALTAR.items():
    m = (hib['cat'] == c).values
    ax.scatter(Z[m, 0], Z[m, 1], s=62, color=col, edgecolor="white", linewidth=1.4, label=NOMBRE_CAT[c], zorder=3)
# etiquetas: todos los resaltados + referencias de otras categorias (evita amontonar 83 textos)
EXTRA = {'mantequilla', 'aceite vegetal', 'leche entera', 'leche de almendra', 'leche de avena', 'leche de soya',
         'polvo de hornear', 'bicarbonato de sodio', 'stevia', 'eritritol', 'leche condensada', 'crema'}
OMITIR = {'gelatina sin sabor', 'agar agar', 'almidon de maiz', 'semola', 'harina integral', 'harina de maiz',
          'harina de garbanzo', 'pure de zapallo', 'pure de remolacha', 'xilitol', 'harina de quinoa', 'harina de coco', 'panela', 'azucar flor'}
sel = [i for i, n in enumerate(hib.index) if (hib.cat[n] in RESALTAR or n in EXTRA) and n not in OMITIR]
ETIQ_ALT = {'eritritol': 'eritritol / xilitol', 'azucar blanca': 'azucar blanca / flor', 'gel de linaza': 'gel de linaza',
            'harina de trigo': 'harina de trigo'}
textos = [ax.text(Z[i, 0], Z[i, 1], ETIQ_ALT.get(hib.index[i], hib.index[i]), fontsize=8, color=INK2) for i in sel]
ax.axhline(0, color=GRID, lw=0.8, zorder=0); ax.axvline(0, color=GRID, lw=0.8, zorder=0)
ax.set_xlabel(f"Componente 1 ({ev[0]:.0f}% de la varianza)"); ax.set_ylabel(f"Componente 2 ({ev[1]:.0f}% de la varianza)")
ax.set_title("Espacio vectorial de ingredientes (PCA 2D, matriz objetivizada)", loc="left", fontsize=12, fontweight="bold")
ax.legend(frameon=False, loc="upper right")
adjust_text(textos, ax=ax, expand=(1.3, 1.6), max_move=None, ensure_inside_axes=True,  arrowprops=dict(arrowstyle="-", color=GRIS, lw=0.6))
pie(fig, f"Los dos primeros componentes explican {ev.sum():.0f}% de la varianza de las 5 propiedades. "
         "Se etiqueta una selección de ingredientes; los puntos sobrepuestos son ingredientes con propiedades casi idénticas.")
fig.savefig(f"{OUT}/fig2_pca_ingredientes.png"); plt.close(fig)

# =====================================================================
# FIG 3 - matriz de similitud coseno ordenada por categoria
# =====================================================================
S = cosine_similarity(Xs)
orden = sorted(range(len(hib)), key=lambda i: (ORDEN_CAT.index(hib.cat.iloc[i]), hib.index[i]))
S = S[np.ix_(orden, orden)]
cats = hib.cat.iloc[orden].tolist()
sec = LinearSegmentedColormap.from_list("sec", ["#f1f6fd", "#9cc3f0", "#2a78d6", "#0e2f5c"])
fig, ax = plt.subplots(figsize=(9, 8.2))
im = ax.imshow(S, cmap=sec, vmin=-1, vmax=1, interpolation="nearest")
lim = [0] + [i for i in range(1, len(cats)) if cats[i] != cats[i - 1]] + [len(cats)]
for a in lim[1:-1]:
    ax.axhline(a - 0.5, color="white", lw=1.6); ax.axvline(a - 0.5, color="white", lw=1.6)
mid = [(lim[i] + lim[i + 1] - 1) / 2 for i in range(len(lim) - 1)]
nombres = [NOMBRE_CAT[cats[lim[i]]] for i in range(len(lim) - 1)]
ax.set_xticks(mid); ax.set_xticklabels(nombres, rotation=40, ha="right", fontsize=9)
ax.set_yticks(mid); ax.set_yticklabels(nombres, fontsize=9)
ax.tick_params(length=0)
for s in ax.spines.values(): s.set_visible(False)
cb = fig.colorbar(im, ax=ax, fraction=0.04, pad=0.02); cb.set_label("Similitud coseno"); cb.outline.set_visible(False)
ax.set_title("Similitud entre ingredientes (83 × 83)", loc="left", fontsize=12, fontweight="bold")
pie(fig, "Cada celda es la similitud coseno entre dos ingredientes sobre las 5 propiedades estandarizadas; "
         "agrupados por categoría (las líneas blancas separan categorías).", y=-0.12)
fig.savefig(f"{OUT}/fig3_matriz_similitud.png"); plt.close(fig)

# =====================================================================
# FIG 4 y 5 - validacion contra 18 pares de fuentes externas
# =====================================================================
PARES = [("huevo","gel de linaza"),("huevo","gel de chia"),("huevo","aquafaba"),("huevo","platano maduro"),
 ("huevo","pure de manzana"),("mantequilla","aceite vegetal"),("mantequilla","aceite de coco"),
 ("harina de trigo","harina de arroz"),("harina de trigo","tapioca"),("harina de trigo","almidon de papa"),
 ("harina de trigo","harina de avena"),("azucar blanca","stevia"),("azucar blanca","eritritol"),
 ("azucar blanca","azucar de coco"),("leche entera","leche de almendra"),("leche entera","leche de avena"),
 ("leche entera","leche de soya"),("leche entera","leche de coco")]
def sim(df): return cosine_similarity(StandardScaler().fit_transform(df[F].values.astype(float)))
def rango(df, s, o, t):
    i = df.index.get_loc(o); sc = s[i].copy(); sc[i] = -np.inf
    return list(df.index[np.argsort(sc)[::-1]]).index(t) + 1
so, sh = sim(orig), sim(hib)
ro = np.array([rango(orig, so, o, t) for o, t in PARES]); rh = np.array([rango(hib, sh, o, t) for o, t in PARES])
KS = [1, 3, 5, 10]
met = {"Original": [(ro <= k).mean() for k in KS] + [(1 / ro).mean()],
       "Objetivizada": [(rh <= k).mean() for k in KS] + [(1 / rh).mean()]}
etq_m = [f"Precisión@{k}" for k in KS] + ["MRR"]

fig, ax = plt.subplots(figsize=(9, 4.6))
x = np.arange(len(etq_m)); w = 0.36
for j, (nom, col) in enumerate([("Original", AZUL), ("Objetivizada", NARANJA)]):
    b = ax.bar(x + (j - 0.5) * (w + 0.03), met[nom], w, color=col, label=nom, zorder=3)
    for r, v in zip(b, met[nom]):
        ax.text(r.get_x() + r.get_width() / 2, v + 0.015, f"{v:.2f}", ha="center", va="bottom", fontsize=9, color=INK)
ax.set_xticks(x); ax.set_xticklabels(etq_m); ax.set_ylim(0, 1.05); ax.set_ylabel("Valor de la métrica (0–1)")
ax.grid(axis="y", color=GRID, lw=0.8, zorder=0); ax.legend(frameon=False, loc="upper left", title="Matriz de propiedades", title_fontsize=9)
ax.set_title("Desempeño frente a 18 pares de sustitución de fuentes externas", loc="left", fontsize=12, fontweight="bold")
pie(fig, "Precisión@k: proporción de pares cuyo sustituto verificado aparece entre los k primeros del modelo. "
         "MRR: promedio de 1/posición. n = 18 pares (King Arthur Baking, Dr. Oetker, The Kitchn, Hersheyland).")
fig.savefig(f"{OUT}/fig4_comparacion_metricas.png"); plt.close(fig)

fig, ax = plt.subplots(figsize=(9.5, 6.6))
y = np.arange(len(PARES))[::-1]
for yi, a, b in zip(y, ro, rh):
    col = AZUL if b < a else (NARANJA if b > a else GRIS)
    ax.plot([a, b], [yi, yi], color=col, lw=2.2, zorder=2, solid_capstyle="round")
ax.scatter(ro, y, s=62, color="white", edgecolor=INK2, linewidth=1.6, zorder=3)
ax.scatter(rh, y, s=62, color=INK2, edgecolor=INK2, zorder=3)
ax.set_yticks(y); ax.set_yticklabels([f"{o} → {t}" for o, t in PARES], fontsize=9)
ax.set_xlabel("Posición del sustituto verificado en el ranking (1 = primero; menor es mejor)")
ax.set_xlim(0, 17); ax.xaxis.set_major_locator(plt.MultipleLocator(2)); ax.grid(axis="x", color=GRID, lw=0.8, zorder=0)
ax.axvline(5, color=GRIS, lw=1, ls=(0, (4, 3)), zorder=1); ax.text(5.15, len(PARES) - 0.45, "top 5", fontsize=8, color=INK2)
mej, emp, igu = int((rh < ro).sum()), int((rh > ro).sum()), int((rh == ro).sum())
h = [plt.Line2D([0], [0], marker="o", color="w", markeredgecolor=INK2, markerfacecolor="white", markersize=8, lw=0),
     plt.Line2D([0], [0], marker="o", color="w", markerfacecolor=INK2, markersize=8, lw=0),
     plt.Line2D([0], [0], color=AZUL, lw=2.2), plt.Line2D([0], [0], color=NARANJA, lw=2.2), plt.Line2D([0], [0], color=GRIS, lw=2.2)]
ax.legend(h, ["Original", "Objetivizada", f"Mejora ({mej} pares)", f"Empeora ({emp} pares)", f"Igual ({igu} pares)"],
          frameon=False, loc="upper right", fontsize=9)
ax.set_title("Posición del sustituto verificado, par por par", loc="left", fontsize=12, fontweight="bold")
pie(fig, "Cada fila es un par (original → sustituto) tomado de guías técnicas de repostería; el modelo no lo usó para entrenarse.")
fig.savefig(f"{OUT}/fig5_rango_por_par.png"); plt.close(fig)

print("Listo. Resumen para el informe:")
for k, v in met.items(): print(f"  {k:<13}", "  ".join(f"{e}={x:.3f}" for e, x in zip(etq_m, v)))
print(f"  Pares que mejoran / empeoran / igual: {mej} / {emp} / {igu}")
print(f"  Varianza PCA: PC1 {ev[0]:.1f}%  PC2 {ev[1]:.1f}%  (total {ev.sum():.1f}%)")
