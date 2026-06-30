from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.routers import auth, ingredients, recipes, quotes

app = FastAPI(
    title="Sistema de Gestión de Recetas — Repostería",
    description="API para gestión de recetas, escalado de ingredientes, sustitutos con IA y cotizaciones.",
    version="1.0.0",
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173", "http://localhost:3000"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(auth.router)
app.include_router(ingredients.router)
app.include_router(recipes.router)
app.include_router(quotes.router)


@app.get("/", tags=["Health"])
async def root():
    return {"status": "ok", "message": "API Repostería corriendo"}


@app.get("/health", tags=["Health"])
async def health():
    return {"status": "ok"}
