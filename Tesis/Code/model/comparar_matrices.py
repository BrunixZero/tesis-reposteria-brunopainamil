import sys
import numpy as np, pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.metrics.pairwise import cosine_similarity

ns = {}
exec(open(sys.argv[1]).read(), ns)
cols = ['nombre','binding_power','moisture','fat_content','sweetness','leavening','is_vegan','is_gluten_free','precio_clp']
orig = pd.DataFrame(ns['datos'], columns=cols).set_index('nombre')
hib = pd.read_csv(sys.argv[2]).set_index('nombre')
F = ['binding_power','moisture','fat_content','sweetness','leavening']

PARES = [("huevo","gel de linaza"),("huevo","gel de chia"),("huevo","aquafaba"),("huevo","platano maduro"),
 ("huevo","pure de manzana"),("mantequilla","aceite vegetal"),("mantequilla","aceite de coco"),
 ("harina de trigo","harina de arroz"),("harina de trigo","tapioca"),("harina de trigo","almidon de papa"),
 ("harina de trigo","harina de avena"),("azucar blanca","stevia"),("azucar blanca","eritritol"),
 ("azucar blanca","azucar de coco"),("leche entera","leche de almendra"),("leche entera","leche de avena"),
 ("leche entera","leche de soya"),("leche entera","leche de coco")]

def sim(df):
    return cosine_similarity(StandardScaler().fit_transform(df[F].values.astype(float)))

def rank(df, s, o, t):
    i = df.index.get_loc(o); sc = s[i].copy(); sc[i] = -np.inf
    orden = list(df.index[np.argsort(sc)[::-1]])
    return orden.index(t) + 1

def prec(df, k):
    s = sim(df)
    return sum(rank(df, s, o, t) <= k for o, t in PARES) / len(PARES)

def mrr(df):
    s = sim(df)
    return np.mean([1 / rank(df, s, o, t) for o, t in PARES])

print(f"Pares evaluados: {len(PARES)}\n")
print(f"{'metrica':<14}{'original':>10}{'objetivizada':>14}")
for k in (1, 3, 5, 10):
    print(f"{'precision@'+str(k):<14}{prec(orig,k):>10.3f}{prec(hib,k):>14.3f}")
print(f"{'MRR':<14}{mrr(orig):>10.3f}{mrr(hib):>14.3f}")

so, sh = sim(orig), sim(hib)
print("\nRango del sustituto verificado (1 = primero):")
print(f"{'par':<38}{'orig':>6}{'obj':>6}")
for o, t in PARES:
    print(f"{o+' -> '+t:<38}{rank(orig,so,o,t):>6}{rank(hib,sh,o,t):>6}")
