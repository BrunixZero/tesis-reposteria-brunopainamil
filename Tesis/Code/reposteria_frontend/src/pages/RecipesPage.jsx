import { useState } from 'react'
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query'
import toast from 'react-hot-toast'
import api from '../services/api'
import { Btn, Card, Badge, PageHeader, Modal, FormField, EmptyState, Spinner } from '../components/UI'
import { Plus, BookOpen, Clock, Users, Trash2, ChevronRight, X, Scale } from 'lucide-react'

const CATEGORIES = ['torta', 'galleta', 'pan', 'muffin', 'pie', 'postre', 'otro']

function RecipeCard({ recipe, onClick, onDelete }) {
  return (
    <Card style={{ cursor: 'pointer', transition: 'border-color 0.2s' }}
      onMouseEnter={e => e.currentTarget.style.borderColor = 'var(--accent)'}
      onMouseLeave={e => e.currentTarget.style.borderColor = 'var(--border)'}>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start' }}>
        <div onClick={onClick} style={{ flex: 1 }}>
          <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', marginBottom: '0.5rem' }}>
            {recipe.category && <Badge color="warning">{recipe.category}</Badge>}
          </div>
          <h3 style={{ fontSize: '1.1rem', marginBottom: '0.4rem' }}>{recipe.name}</h3>
          {recipe.description && (
            <p style={{ color: 'var(--muted)', fontSize: '0.85rem', marginBottom: '0.75rem',
              overflow: 'hidden', display: '-webkit-box', WebkitLineClamp: 2, WebkitBoxOrient: 'vertical' }}>
              {recipe.description}
            </p>
          )}
          <div style={{ display: 'flex', gap: '1rem', color: 'var(--muted)', fontSize: '0.8rem' }}>
            <span style={{ display: 'flex', alignItems: 'center', gap: '0.3rem' }}>
              <Users size={13} /> {recipe.base_servings} porciones
            </span>
            {recipe.prep_time_min > 0 && (
              <span style={{ display: 'flex', alignItems: 'center', gap: '0.3rem' }}>
                <Clock size={13} /> {recipe.prep_time_min + recipe.cook_time_min} min
              </span>
            )}
            <span style={{ display: 'flex', alignItems: 'center', gap: '0.3rem' }}>
              <BookOpen size={13} /> {recipe.ingredients?.length || 0} ingredientes
            </span>
          </div>
        </div>
        <div style={{ display: 'flex', gap: '0.5rem', marginLeft: '1rem' }}>
          <Btn variant="ghost" size="sm" onClick={onClick}><ChevronRight size={16} /></Btn>
          <Btn variant="ghost" size="sm" onClick={(e) => { e.stopPropagation(); onDelete(recipe.id) }}>
            <Trash2 size={15} color="var(--danger)" />
          </Btn>
        </div>
      </div>
    </Card>
  )
}

function ScaleModal({ recipe, open, onClose }) {
  const [servings, setServings] = useState(recipe?.base_servings || 1)
  const { data, isFetching } = useQuery({
    queryKey: ['scale', recipe?.id, servings],
    queryFn: () => api.get(`/recipes/${recipe.id}/scale?servings=${servings}`).then(r => r.data),
    enabled: open && !!recipe,
  })

  if (!recipe) return null
  const factor = servings / recipe.base_servings

  return (
    <Modal open={open} onClose={onClose} title={`Escalar — ${recipe.name}`} width={540}>
      <div style={{ display: 'flex', alignItems: 'center', gap: '1rem', marginBottom: '1.5rem' }}>
        <label style={{ color: 'var(--muted)', fontSize: '0.85rem', whiteSpace: 'nowrap' }}>Porciones:</label>
        <input type="number" min={1} value={servings}
          onChange={e => setServings(Math.max(1, parseInt(e.target.value) || 1))}
          style={{ width: 100 }} />
        {factor !== 1 && (
          <Badge color={factor > 1 ? 'warning' : 'success'}>×{factor.toFixed(2)}</Badge>
        )}
      </div>

      {isFetching ? (
        <div style={{ textAlign: 'center', padding: '2rem' }}><Spinner /></div>
      ) : data ? (
        <div>
          <div style={{ display: 'flex', flexDirection: 'column', gap: '0.5rem', marginBottom: '1rem' }}>
            {data.ingredients.map(ing => (
              <div key={ing.ingredient_id} style={{
                display: 'flex', justifyContent: 'space-between',
                padding: '0.6rem 0.75rem',
                background: 'var(--bg3)',
                borderRadius: 'var(--radius)',
                fontSize: '0.9rem',
              }}>
                <span>{ing.name}</span>
                <span style={{ color: 'var(--accent2)', fontWeight: 500 }}>
                  {ing.quantity_scaled} {ing.unit}
                </span>
              </div>
            ))}
          </div>
          <div style={{
            padding: '0.75rem 1rem',
            background: 'rgba(224,122,95,0.08)',
            borderRadius: 'var(--radius)',
            border: '1px solid rgba(224,122,95,0.2)',
            display: 'flex', justifyContent: 'space-between',
          }}>
            <span style={{ color: 'var(--muted)', fontSize: '0.85rem' }}>Costo estimado ingredientes</span>
            <span style={{ color: 'var(--accent)', fontWeight: 600 }}>
              ${data.ingredients.reduce((s, i) => s + i.subtotal, 0).toLocaleString('es-CL')}
            </span>
          </div>
        </div>
      ) : null}
    </Modal>
  )
}

function RecipeForm({ recipe, ingredients, onSave, onClose }) {
  const [form, setForm] = useState({
    name: recipe?.name || '',
    description: recipe?.description || '',
    category: recipe?.category || '',
    base_servings: recipe?.base_servings || 8,
    prep_time_min: recipe?.prep_time_min || 0,
    cook_time_min: recipe?.cook_time_min || 0,
    instructions: recipe?.instructions || '',
    is_public: recipe?.is_public || false,
    ingredients: recipe?.ingredients?.map(i => ({
      ingredient_id: i.ingredient_id,
      quantity: i.quantity,
      unit: i.unit,
      notes: i.notes || '',
    })) || [],
  })

  const set = k => e => setForm(f => ({ ...f, [k]: e.target.value }))

  const addIngredient = () => setForm(f => ({
    ...f,
    ingredients: [...f.ingredients, { ingredient_id: ingredients[0]?.id || '', quantity: 1, unit: 'g', notes: '' }]
  }))

  const removeIngredient = idx => setForm(f => ({
    ...f, ingredients: f.ingredients.filter((_, i) => i !== idx)
  }))

  const setIng = (idx, k, v) => setForm(f => ({
    ...f,
    ingredients: f.ingredients.map((ing, i) => i === idx ? { ...ing, [k]: v } : ing)
  }))

  return (
    <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
      <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '1rem' }}>
        <FormField label="Nombre *">
          <input value={form.name} onChange={set('name')} placeholder="Ej: Torta de chocolate" />
        </FormField>
        <FormField label="Categoría">
          <select value={form.category} onChange={set('category')}>
            <option value="">Sin categoría</option>
            {CATEGORIES.map(c => <option key={c} value={c}>{c}</option>)}
          </select>
        </FormField>
      </div>

      <FormField label="Descripción">
        <textarea value={form.description} onChange={set('description')} rows={2}
          placeholder="Descripción breve de la receta..." />
      </FormField>

      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(3, 1fr)', gap: '1rem' }}>
        <FormField label="Porciones base">
          <input type="number" min={1} value={form.base_servings}
            onChange={e => setForm(f => ({ ...f, base_servings: parseInt(e.target.value) || 1 }))} />
        </FormField>
        <FormField label="Prep. (min)">
          <input type="number" min={0} value={form.prep_time_min}
            onChange={e => setForm(f => ({ ...f, prep_time_min: parseInt(e.target.value) || 0 }))} />
        </FormField>
        <FormField label="Cocción (min)">
          <input type="number" min={0} value={form.cook_time_min}
            onChange={e => setForm(f => ({ ...f, cook_time_min: parseInt(e.target.value) || 0 }))} />
        </FormField>
      </div>

      {/* Ingredientes */}
      <div>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '0.75rem' }}>
          <label style={{ fontSize: '0.82rem', color: 'var(--muted)', fontWeight: 500 }}>Ingredientes</label>
          <Btn variant="secondary" size="sm" onClick={addIngredient}><Plus size={14} /> Agregar</Btn>
        </div>
        <div style={{ display: 'flex', flexDirection: 'column', gap: '0.5rem' }}>
          {form.ingredients.map((ing, idx) => (
            <div key={idx} style={{ display: 'grid', gridTemplateColumns: '2fr 1fr 1fr auto', gap: '0.5rem', alignItems: 'center' }}>
              <select value={ing.ingredient_id}
                onChange={e => setIng(idx, 'ingredient_id', e.target.value)}>
                {ingredients.map(i => <option key={i.id} value={i.id}>{i.name}</option>)}
              </select>
              <input type="number" min={0} step="0.01" value={ing.quantity}
                onChange={e => setIng(idx, 'quantity', parseFloat(e.target.value) || 0)}
                placeholder="Cantidad" />
              <input value={ing.unit} onChange={e => setIng(idx, 'unit', e.target.value)} placeholder="g / ml / u" />
              <button onClick={() => removeIngredient(idx)}
                style={{ background: 'none', color: 'var(--danger)', padding: '0.3rem' }}>
                <X size={15} />
              </button>
            </div>
          ))}
        </div>
      </div>

      <FormField label="Instrucciones">
        <textarea value={form.instructions} onChange={set('instructions')} rows={4}
          placeholder="Paso 1: Precalentar el horno..." />
      </FormField>

      <div style={{ display: 'flex', gap: '0.75rem', justifyContent: 'flex-end', marginTop: '0.5rem' }}>
        <Btn variant="secondary" onClick={onClose}>Cancelar</Btn>
        <Btn onClick={() => onSave(form)}>Guardar receta</Btn>
      </div>
    </div>
  )
}

export default function RecipesPage() {
  const qc = useQueryClient()
  const [modalOpen, setModalOpen] = useState(false)
  const [detailRecipe, setDetailRecipe] = useState(null)
  const [scaleRecipe, setScaleRecipe] = useState(null)
  const [search, setSearch] = useState('')

  const { data: recipes = [], isLoading } = useQuery({
    queryKey: ['recipes'],
    queryFn: () => api.get('/recipes').then(r => r.data),
  })

  const { data: ingredients = [] } = useQuery({
    queryKey: ['ingredients'],
    queryFn: () => api.get('/ingredients').then(r => r.data),
  })

  const saveMutation = useMutation({
    mutationFn: (form) => detailRecipe
      ? api.put(`/recipes/${detailRecipe.id}`, form)
      : api.post('/recipes', form),
    onSuccess: () => {
      qc.invalidateQueries(['recipes'])
      setModalOpen(false)
      setDetailRecipe(null)
      toast.success('Receta guardada')
    },
    onError: e => toast.error(e.response?.data?.detail || 'Error al guardar'),
  })

  const deleteMutation = useMutation({
    mutationFn: (id) => api.delete(`/recipes/${id}`),
    onSuccess: () => { qc.invalidateQueries(['recipes']); toast.success('Receta eliminada') },
  })

  const filtered = recipes.filter(r => r.name.toLowerCase().includes(search.toLowerCase()))

  return (
    <div className="fade-in">
      <PageHeader
        title="Mis Recetas"
        subtitle={`${recipes.length} receta${recipes.length !== 1 ? 's' : ''} guardada${recipes.length !== 1 ? 's' : ''}`}
        action={
          <Btn onClick={() => { setDetailRecipe(null); setModalOpen(true) }}>
            <Plus size={16} /> Nueva receta
          </Btn>
        }
      />

      <input placeholder="Buscar receta..." value={search} onChange={e => setSearch(e.target.value)}
        style={{ marginBottom: '1.5rem', maxWidth: 320 }} />

      {isLoading ? (
        <div style={{ textAlign: 'center', padding: '3rem' }}><Spinner size={32} /></div>
      ) : filtered.length === 0 ? (
        <EmptyState icon={BookOpen} title="Sin recetas aún"
          subtitle="Agrega tu primera receta para comenzar"
          action={<Btn onClick={() => setModalOpen(true)}><Plus size={16} /> Crear receta</Btn>} />
      ) : (
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(300px, 1fr))', gap: '1rem' }}>
          {filtered.map(r => (
            <div key={r.id}>
              <RecipeCard
                recipe={r}
                onClick={() => { setDetailRecipe(r); setModalOpen(true) }}
                onDelete={(id) => deleteMutation.mutate(id)}
              />
              <div style={{ marginTop: '0.5rem', paddingLeft: '0.25rem' }}>
                <Btn variant="ghost" size="sm" onClick={() => setScaleRecipe(r)}>
                  <Scale size={13} /> Escalar
                </Btn>
              </div>
            </div>
          ))}
        </div>
      )}

      {/* Modal crear/editar */}
      <Modal open={modalOpen} onClose={() => { setModalOpen(false); setDetailRecipe(null) }}
        title={detailRecipe ? 'Editar receta' : 'Nueva receta'} width={620}>
        <RecipeForm
          recipe={detailRecipe}
          ingredients={ingredients}
          onSave={(form) => saveMutation.mutate(form)}
          onClose={() => { setModalOpen(false); setDetailRecipe(null) }}
        />
      </Modal>

      {/* Modal escalar */}
      <ScaleModal recipe={scaleRecipe} open={!!scaleRecipe} onClose={() => setScaleRecipe(null)} />
    </div>
  )
}
