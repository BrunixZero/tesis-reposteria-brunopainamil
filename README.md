# 🍰 Sistema de Gestión Inteligente de Recetas y Presupuestos para Repostería

Aplicación web para pequeños negocios y emprendedores del rubro de la repostería y cocina. Permite gestionar recetas, escalar ingredientes automáticamente, generar cotizaciones con cálculo de márgenes y recomendar sustitutos de ingredientes mediante un modelo de Machine Learning (KNN).

> **Proyecto de Título — Ingeniería Civil Informática**  
> Universidad Andrés Bello · Bruno Ignacio Painamil Navia · 2026

---

## Funcionalidades principales

- **Gestión de recetas** — Crear, editar y eliminar recetas con lista de ingredientes
- **Escalado automático** — Ajusta las cantidades de ingredientes a cualquier número de porciones en tiempo real
- **Cotizaciones inteligentes** — Genera presupuestos automáticos con gastos indirectos y margen de ganancia configurable
- **Sustitutos con IA** — Modelo KNN entrenado con 85 ingredientes recomienda sustitutos según similitud de propiedades culinarias
- **Filtros alimentarios** — Filtra sustitutos por restricción vegana o sin gluten (celíacos)
- **Autenticación segura** — Registro y login con JWT, contraseñas hasheadas con bcrypt

---

## Stack tecnológico

| Capa | Tecnología |
|---|---|
| Base de datos | PostgreSQL 15 |
| Backend | Python 3.12 + FastAPI |
| ORM | SQLAlchemy 2.0 (async) |
| Frontend | React 18 + Vite |
| Modelo IA | scikit-learn (KNN + cosine similarity) |
| Infraestructura | Docker + Docker Compose |

---

## Requisitos previos

Antes de comenzar, asegúrate de tener instalado:

- [Docker Desktop](https://www.docker.com/products/docker-desktop) (incluye Docker Compose)
- [Node.js 20+](https://nodejs.org/) (para el frontend)
- [Git](https://git-scm.com/)

---

## Instalación y ejecución

### 1. Clonar el repositorio

```bash
git clone https://github.com/BrunixZero/tesis-reposteria-brunopainamil.git
cd sistema-gestion-reposteria
```

### 2. Levantar base de datos y backend (Docker)

```bash
cd reposteria_backend
docker-compose up --build
```

La primera vez descarga las imágenes de Docker y ejecuta el `schema.sql` automáticamente con datos de prueba precargados (83 ingredientes, conversiones de unidades).

Cuando veas esto, el backend está listo:

```
reposteria-api | INFO:     Application startup complete.
reposteria-api | INFO:     Uvicorn running on http://0.0.0.0:8000
```

### 3. Levantar el frontend (nueva terminal)

```bash
cd reposteria_frontend
npm install
npm run dev
```

### 4. Abrir la aplicación

| Servicio | URL |
|---|---|
| Aplicación web | http://localhost:5173 |
| API docs (Swagger UI) | http://localhost:8000/docs |

---

## Uso diario (después de la instalación)

Cada vez que quieras trabajar en el proyecto necesitas **dos terminales**:

**Terminal 1 — Backend + Base de datos:**
```bash
cd reposteria_backend
docker-compose up
```

**Terminal 2 — Frontend:**
```bash
cd reposteria_frontend
npm run dev
```

Para detener todo:
```bash
# Terminal 1
Ctrl + C
docker-compose down
```

> Los datos de la base de datos se conservan entre reinicios gracias al volumen Docker `pgdata`.

---

## Variables de entorno

El backend usa variables de entorno definidas en `docker-compose.yml`. Para desarrollo local fuera de Docker, crea un archivo `.env` en `reposteria_backend/`:

```env
DATABASE_URL=postgresql+asyncpg://bruno:tesis2026@localhost:5432/reposteria_db
SECRET_KEY=cambia_esto_por_una_clave_secreta_larga
ALGORITHM=HS256
ACCESS_TOKEN_EXPIRE_MINUTES=1440
```

> Nunca subas el archivo `.env` al repositorio. Ya está incluido en `.gitignore`.

---

## Módulo de IA — Modelo KNN

El modelo de recomendación de sustitutos fue entrenado en Google Colab. Si quieres re-entrenar o actualizar el modelo:

1. Abre `KNN_Sustitutos_Tesis_v2.ipynb` en [Google Colab](https://colab.research.google.com/)
2. Ejecuta todas las celdas en orden
3. Descarga el archivo `import_modelo.sql` generado
4. Importa los resultados a la base de datos:

```bash
# Copiar el SQL al contenedor
docker cp import_modelo.sql reposteria-db:/tmp/

# Ejecutar la importación
docker exec -i reposteria-db psql -U bruno -d reposteria_db -f /tmp/import_modelo.sql

# Verificar
docker exec -it reposteria-db psql -U bruno -d reposteria_db -c "SELECT COUNT(*) FROM substitutes;"
```

---

## Estructura del proyecto

```
sistema-gestion-reposteria/
│
├── reposteria_backend/          # API REST con FastAPI
│   ├── app/
│   │   ├── routers/             # Endpoints HTTP
│   │   ├── models/              # Modelos SQLAlchemy
│   │   ├── schemas/             # Schemas Pydantic
│   │   ├── services/            # Lógica de negocio
│   │   ├── config.py            # Configuración y conexión BD
│   │   └── main.py              # Entrada de la aplicación
│   ├── schema.sql               # Esquema de BD + datos semilla
│   ├── docker-compose.yml
│   ├── Dockerfile
│   └── requirements.txt
│
├── reposteria_frontend/         # Interfaz web con React
│   ├── src/
│   │   ├── pages/               # LoginPage, RecipesPage, etc.
│   │   ├── components/          # Sidebar, UI primitives
│   │   ├── context/             # AuthContext
│   │   └── services/            # Cliente API (Axios)
│   └── package.json
│
└── KNN_Sustitutos_Tesis_v2.ipynb   # Notebook de entrenamiento IA
```

---

## Base de datos

El sistema usa PostgreSQL con 8 tablas:

| Tabla | Descripción |
|---|---|
| `users` | Usuarios del sistema |
| `ingredients` | Catálogo de ingredientes con propiedades culinarias KNN |
| `recipes` | Recetas creadas por los usuarios |
| `recipe_ingredients` | Relación receta ↔ ingredientes con cantidades |
| `substitutes` | Pares de sustitutos generados por el modelo KNN |
| `quotes` | Cotizaciones / presupuestos |
| `quote_items` | Detalle de ingredientes escalados por cotización |
| `unit_conversions` | Tabla de conversiones de unidades |

Para acceder directamente a la base de datos:

```bash
docker exec -it reposteria-db psql -U bruno -d reposteria_db
```

---

## Licencia

MIT License — Bruno Ignacio Painamil Navia, 2026
