import { useState } from 'react'
import { useQuery } from '@tanstack/react-query'
import api from '../services/api'
import { Card, Badge, PageHeader, Spinner, EmptyState } from '../components/UI'
import { ShoppingBag, Leaf, Wheat, ArrowRight, Search } from 'lucide-react'

function PropertyBar({ value, max = 10, color = 'var(--accent)' }) {
  return (
    <div style={{ height: 4, background: 'var(--bg3)', borderRadius: 999, overflow: 'hidden', flex: 1 }}>
      <div style={{ height: '100%', width: `${(value / max) * 100}%`, background: color, borderRadius: 999 }} />
    </div>
  )
}

function SubstitutePanel({ ingredient }) {
  const [veganOnly, setVeganOnly] = useState(false)
  const [gfOnly, setGfOnly] = useState(false)

  const { data, isLoading } = useQuery({
    queryKey: ['substitutes', ingredient?.id, veganOnly, gfOnly],
    queryFn: () => api.get(`/ingredients/${ingredient.id}/substitutes?vegan_only=${veganOnly}&gluten_free_only=${gfOnly}`)
      .then(r => r.data),
    enabled: !!ingredient,
  })

  if (!ingredient) return (
    <div style={{ textAlign: 'center', color: 'var(--muted)', padding: '3rem 1rem', fontSize: '0.9rem' }}>
      <ArrowRight size={24} style={{ marginBottom: '0.5rem', opacity: 0.4 }} />
      <p>Selecciona un ingrediente para ver sus sustitutos</p>
    </div>
  )

  return (
    <div>
      <h3 style={{ marginBottom: '0.25rem' }}>{ingredient.name}</h3>
      <p style={{ color: 'var(--muted)', fontSize: '0.85rem', marginBottom: '1.25rem' }}>Sustitutos recomendados por IA</p>

      {/* Propiedades del ingrediente */}
      <div style={{ marginBottom: '1.25rem', padding: '1rem', background: 'var(--bg3)', borderRadius: 'var(--radius)' }}>
        <p style={{ fontSize: '0.75rem', color: 'var(--muted)', marginBottom: '0.75rem', fontWeight: 500 }}>PROPIEDADES KNN</p>
        {[
          ['Aglutinante', ingredient.binding_power, 'var(--accent)'],
          ['Humedad', ingredient.moisture, '#7ec8e3'],
          ['Grasa', ingredient.fat_content, 'var(--accent2)'],
          ['Dulzor', ingredient.sweetness, '#c8a4d4'],
          ['Leudante', ingredient.leavening, 'var(--success)'],
        ].map(([label, val, color]) => (
          <div key={label} style={{ display: 'flex', alignItems: 'center', gap: '0.75rem', marginBottom: '0.4rem' }}>
            <span style={{ fontSize: '0.75rem', color: 'var(--muted)', width: 80 }}>{label}</span>
            <PropertyBar value={val} color={color} />
            <span style={{ fontSize: '0.75rem', color: 'var(--muted)', width: 20, textAlign: 'right' }}>{val}</span>
          </div>
        ))}
      </div>

      {/* Filtros */}
      <div style={{ display: 'flex', gap: '0.5rem', marginBottom: '1rem' }}>
        {[['Vegano', veganOnly, setVeganOnly], ['Sin gluten', gfOnly, setGfOnly]].map(([label, val, setter]) => (
          <button key={label} onClick={() => setter(v => !v)} style={{
            padding: '0.3rem 0.75rem',
            borderRadius: 999,
            fontSize: '0.78rem',
            border: '1px solid',
            borderColor: val ? 'var(--success)' : 'var(--border)',
            background: val ? 'rgba(129,178,154,0.1)' : 'transparent',
            color: val ? 'var(--success)' : 'var(--muted)',
            cursor: 'pointer',
          }}>{label}</button>
        ))}
      </div>

      {isLoading ? (
        <div style={{ textAlign: 'center', padding: '1.5rem' }}><Spinner /></div>
      ) : data?.substitutes?.length === 0 ? (
        <p style={{ color: 'var(--muted)', fontSize: '0.85rem', textAlign: 'center', padding: '1.5rem' }}>
          No hay sustitutos con esos filtros
        </p>
      ) : (
        <div style={{ display: 'flex', flexDirection: 'column', gap: '0.5rem' }}>
          {data?.substitutes?.map(s => (
            <div key={s.substitute_id} style={{
              padding: '0.75rem 1rem',
              background: 'var(--bg3)',
              borderRadius: 'var(--radius)',
              border: '1px solid var(--border)',
            }}>
              <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '0.3rem' }}>
                <span style={{ fontWeight: 500, fontSize: '0.95rem' }}>{s.substitute_name}</span>
                <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem' }}>
                  <span style={{ fontSize: '0.78rem', color: 'var(--accent2)' }}>
                    {Math.round(s.similarity_score * 100)}% similar
                  </span>
                  {s.cost_ratio < 1 && <Badge color="success">más barato</Badge>}
                  {s.cost_ratio > 1 && <Badge color="danger">más caro</Badge>}
                </div>
              </div>
              {s.reason && <p style={{ color: 'var(--muted)', fontSize: '0.8rem' }}>{s.reason}</p>}
              <div style={{ display: 'flex', gap: '0.5rem', marginTop: '0.4rem' }}>
                {s.vegan_safe && <Badge color="success">vegano</Badge>}
                {s.gluten_free_safe && <Badge color="success">sin gluten</Badge>}
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  )
}

export default function IngredientsPage() {
  const [search, setSearch] = useState('')
  const [selected, setSelected] = useState(null)
  const [veganFilter, setVeganFilter] = useState(null)

  const { data: ingredients = [], isLoading } = useQuery({
    queryKey: ['ingredients', veganFilter],
    queryFn: () => {
      let url = '/ingredients'
      if (veganFilter !== null) url += `?is_vegan=${veganFilter}`
      return api.get(url).then(r => r.data)
    },
  })

  const filtered = ingredients.filter(i => i.name.toLowerCase().includes(search.toLowerCase()))

  return (
    <div className="fade-in" style={{ display: 'grid', gridTemplateColumns: '1fr 340px', gap: '1.5rem', height: '100%' }}>
      {/* Left: ingredientes */}
      <div>
        <PageHeader title="Ingredientes" subtitle="Catálogo con propiedades culinarias para el modelo IA" />

        <div style={{ display: 'flex', gap: '0.75rem', marginBottom: '1.25rem', alignItems: 'center' }}>
          <div style={{ position: 'relative', flex: 1, maxWidth: 320 }}>
            <Search size={15} style={{ position: 'absolute', left: 12, top: '50%', transform: 'translateY(-50%)', color: 'var(--muted)' }} />
            <input value={search} onChange={e => setSearch(e.target.value)}
              placeholder="Buscar ingrediente..."
              style={{ paddingLeft: '2.2rem' }} />
          </div>
          {[['Todos', null], ['Veganos', true], ['No veganos', false]].map(([label, val]) => (
            <button key={label} onClick={() => setVeganFilter(val)} style={{
              padding: '0.4rem 0.9rem', borderRadius: 999, fontSize: '0.8rem', border: '1px solid',
              borderColor: veganFilter === val ? 'var(--accent)' : 'var(--border)',
              background: veganFilter === val ? 'rgba(224,122,95,0.1)' : 'transparent',
              color: veganFilter === val ? 'var(--accent)' : 'var(--muted)', cursor: 'pointer',
            }}>{label}</button>
          ))}
        </div>

        {isLoading ? (
          <div style={{ textAlign: 'center', padding: '3rem' }}><Spinner size={32} /></div>
        ) : (
          <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(240px, 1fr))', gap: '0.75rem' }}>
            {filtered.map(ing => (
              <div key={ing.id} onClick={() => setSelected(selected?.id === ing.id ? null : ing)}
                style={{
                  padding: '1rem',
                  background: selected?.id === ing.id ? 'rgba(224,122,95,0.08)' : 'var(--bg2)',
                  border: '1px solid',
                  borderColor: selected?.id === ing.id ? 'var(--accent)' : 'var(--border)',
                  borderRadius: 'var(--radius)',
                  cursor: 'pointer',
                  transition: 'all 0.15s',
                }}>
                <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '0.6rem' }}>
                  <span style={{ fontWeight: 500 }}>{ing.name}</span>
                  <div style={{ display: 'flex', gap: '0.25rem' }}>
                    {ing.is_vegan && <Leaf size={13} color="var(--success)" />}
                    {ing.is_gluten_free && <Wheat size={13} color="var(--accent2)" />}
                  </div>
                </div>
                <div style={{ fontSize: '0.78rem', color: 'var(--muted)', marginBottom: '0.5rem' }}>
                  ${ing.price_per_unit.toLocaleString('es-CL')} / {ing.unit_label}
                </div>
                <div style={{ display: 'flex', flexDirection: 'column', gap: '3px' }}>
                  {[
                    ['Aglut.', ing.binding_power, 'var(--accent)'],
                    ['Húmedad', ing.moisture, '#7ec8e3'],
                    ['Grasa', ing.fat_content, 'var(--accent2)'],
                  ].map(([label, val, color]) => (
                    <div key={label} style={{ display: 'flex', gap: '0.5rem', alignItems: 'center' }}>
                      <span style={{ fontSize: '0.68rem', color: 'var(--muted)', width: 45 }}>{label}</span>
                      <PropertyBar value={val} color={color} />
                    </div>
                  ))}
                </div>
              </div>
            ))}
          </div>
        )}
      </div>

      {/* Right: panel de sustitutos */}
      <div style={{ position: 'sticky', top: 0 }}>
        <Card style={{ height: 'calc(100vh - 6rem)', overflowY: 'auto' }}>
          <SubstitutePanel ingredient={selected} />
        </Card>
      </div>
    </div>
  )
}
