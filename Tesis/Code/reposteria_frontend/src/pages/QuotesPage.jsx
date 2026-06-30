import { useState } from 'react'
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query'
import toast from 'react-hot-toast'
import api from '../services/api'
import { Btn, Card, Badge, PageHeader, Modal, FormField, EmptyState, Spinner } from '../components/UI'
import { Plus, FileText, Trash2, CheckCircle, Send, XCircle } from 'lucide-react'

const STATUS_MAP = {
  draft:    { label: 'Borrador',  color: 'muted'   },
  sent:     { label: 'Enviada',   color: 'warning' },
  accepted: { label: 'Aceptada', color: 'success' },
  rejected: { label: 'Rechazada',color: 'danger'  },
}

function QuoteCard({ quote, onDelete, onStatusChange }) {
  const s = STATUS_MAP[quote.status] || STATUS_MAP.draft
  return (
    <Card>
      <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '1rem' }}>
        <div>
          <div style={{ display: 'flex', alignItems: 'center', gap: '0.5rem', marginBottom: '0.3rem' }}>
            <Badge color={s.color}>{s.label}</Badge>
          </div>
          <h3 style={{ fontSize: '1rem' }}>{quote.recipe_name}</h3>
          {quote.client_name && (
            <p style={{ color: 'var(--muted)', fontSize: '0.82rem' }}>Cliente: {quote.client_name}</p>
          )}
        </div>
        <div style={{ textAlign: 'right' }}>
          <div style={{ fontSize: '1.4rem', fontFamily: 'Playfair Display', color: 'var(--accent)' }}>
            ${quote.final_price.toLocaleString('es-CL')}
          </div>
          <div style={{ fontSize: '0.75rem', color: 'var(--muted)' }}>precio sugerido</div>
        </div>
      </div>

      {/* Breakdown */}
      <div style={{ display: 'flex', flexDirection: 'column', gap: '0.3rem', marginBottom: '1rem',
        padding: '0.75rem', background: 'var(--bg3)', borderRadius: 'var(--radius)', fontSize: '0.82rem' }}>
        <div style={{ display: 'flex', justifyContent: 'space-between' }}>
          <span style={{ color: 'var(--muted)' }}>Porciones</span>
          <span>{quote.servings_requested}</span>
        </div>
        <div style={{ display: 'flex', justifyContent: 'space-between' }}>
          <span style={{ color: 'var(--muted)' }}>Costo ingredientes</span>
          <span>${quote.ingredient_cost.toLocaleString('es-CL')}</span>
        </div>
        <div style={{ display: 'flex', justifyContent: 'space-between' }}>
          <span style={{ color: 'var(--muted)' }}>Gastos indirectos</span>
          <span>{quote.overhead_pct}%</span>
        </div>
        <div style={{ display: 'flex', justifyContent: 'space-between' }}>
          <span style={{ color: 'var(--muted)' }}>Margen de ganancia</span>
          <span style={{ color: 'var(--success)' }}>{quote.margin_pct}%</span>
        </div>
      </div>

      {/* Detalle ingredientes */}
      {quote.items?.length > 0 && (
        <div style={{ marginBottom: '1rem' }}>
          <p style={{ fontSize: '0.75rem', color: 'var(--muted)', marginBottom: '0.5rem', fontWeight: 500 }}>
            INGREDIENTES ESCALADOS
          </p>
          <div style={{ display: 'flex', flexDirection: 'column', gap: '0.25rem' }}>
            {quote.items.map(item => (
              <div key={item.ingredient_id} style={{
                display: 'flex', justifyContent: 'space-between',
                fontSize: '0.8rem', color: 'var(--muted)',
              }}>
                <span>{item.ingredient_name} — {item.quantity_needed} {item.unit}</span>
                <span>${item.subtotal.toLocaleString('es-CL')}</span>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Actions */}
      <div style={{ display: 'flex', gap: '0.5rem', flexWrap: 'wrap' }}>
        {quote.status === 'draft' && (
          <Btn variant="secondary" size="sm" onClick={() => onStatusChange(quote.id, 'sent')}>
            <Send size={13} /> Marcar enviada
          </Btn>
        )}
        {quote.status === 'sent' && (
          <>
            <Btn variant="secondary" size="sm" onClick={() => onStatusChange(quote.id, 'accepted')}>
              <CheckCircle size={13} color="var(--success)" /> Aceptada
            </Btn>
            <Btn variant="secondary" size="sm" onClick={() => onStatusChange(quote.id, 'rejected')}>
              <XCircle size={13} color="var(--danger)" /> Rechazada
            </Btn>
          </>
        )}
        <Btn variant="ghost" size="sm" onClick={() => onDelete(quote.id)} style={{ marginLeft: 'auto' }}>
          <Trash2 size={14} color="var(--danger)" />
        </Btn>
      </div>
    </Card>
  )
}

function NewQuoteModal({ open, onClose, recipes }) {
  const qc = useQueryClient()
  const [form, setForm] = useState({
    recipe_id: '',
    client_name: '',
    client_email: '',
    servings_requested: 12,
    overhead_pct: 20,
    margin_pct: 30,
    notes: '',
  })

  const set = k => e => setForm(f => ({ ...f, [k]: e.target.value }))
  const setNum = k => e => setForm(f => ({ ...f, [k]: parseFloat(e.target.value) || 0 }))

  const selectedRecipe = recipes.find(r => r.id === form.recipe_id)
  const estimatedFinal = form.servings_requested > 0 && selectedRecipe ? '(se calculará al guardar)' : '—'

  const mutation = useMutation({
    mutationFn: () => api.post('/quotes', { ...form, recipe_id: form.recipe_id }),
    onSuccess: () => {
      qc.invalidateQueries(['quotes'])
      toast.success('Cotización creada')
      onClose()
      setForm({ recipe_id: '', client_name: '', client_email: '', servings_requested: 12, overhead_pct: 20, margin_pct: 30, notes: '' })
    },
    onError: e => toast.error(e.response?.data?.detail || 'Error al crear cotización'),
  })

  return (
    <Modal open={open} onClose={onClose} title="Nueva cotización" width={540}>
      <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
        <FormField label="Receta *">
          <select value={form.recipe_id} onChange={set('recipe_id')}>
            <option value="">Selecciona una receta</option>
            {recipes.map(r => <option key={r.id} value={r.id}>{r.name} ({r.base_servings} porciones base)</option>)}
          </select>
        </FormField>

        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '1rem' }}>
          <FormField label="Cliente">
            <input value={form.client_name} onChange={set('client_name')} placeholder="Nombre del cliente" />
          </FormField>
          <FormField label="Email cliente">
            <input type="email" value={form.client_email} onChange={set('client_email')} placeholder="cliente@email.cl" />
          </FormField>
        </div>

        <FormField label="Porciones solicitadas">
          <input type="number" min={1} value={form.servings_requested} onChange={setNum('servings_requested')} />
        </FormField>

        <div style={{ display: 'grid', gridTemplateColumns: '1fr 1fr', gap: '1rem' }}>
          <FormField label="Gastos indirectos (%)">
            <input type="number" min={0} max={100} value={form.overhead_pct} onChange={setNum('overhead_pct')} />
          </FormField>
          <FormField label="Margen de ganancia (%)">
            <input type="number" min={0} max={100} value={form.margin_pct} onChange={setNum('margin_pct')} />
          </FormField>
        </div>

        {/* Preview fórmula */}
        <div style={{ padding: '0.75rem 1rem', background: 'rgba(224,122,95,0.08)',
          border: '1px solid rgba(224,122,95,0.2)', borderRadius: 'var(--radius)', fontSize: '0.82rem', color: 'var(--muted)' }}>
          💡 Precio final = costo ingredientes × (1 + {form.overhead_pct}%) × (1 + {form.margin_pct}%)
        </div>

        <FormField label="Notas">
          <textarea value={form.notes} onChange={set('notes')} rows={2} placeholder="Observaciones para el cliente..." />
        </FormField>

        <div style={{ display: 'flex', gap: '0.75rem', justifyContent: 'flex-end' }}>
          <Btn variant="secondary" onClick={onClose}>Cancelar</Btn>
          <Btn onClick={() => mutation.mutate()} disabled={!form.recipe_id || mutation.isPending}>
            {mutation.isPending ? 'Calculando...' : 'Generar cotización'}
          </Btn>
        </div>
      </div>
    </Modal>
  )
}

export default function QuotesPage() {
  const qc = useQueryClient()
  const [modalOpen, setModalOpen] = useState(false)
  const [statusFilter, setStatusFilter] = useState(null)

  const { data: quotes = [], isLoading } = useQuery({
    queryKey: ['quotes', statusFilter],
    queryFn: () => {
      let url = '/quotes'
      if (statusFilter) url += `?status=${statusFilter}`
      return api.get(url).then(r => r.data)
    },
  })

  const { data: recipes = [] } = useQuery({
    queryKey: ['recipes'],
    queryFn: () => api.get('/recipes').then(r => r.data),
  })

  const deleteMutation = useMutation({
    mutationFn: id => api.delete(`/quotes/${id}`),
    onSuccess: () => { qc.invalidateQueries(['quotes']); toast.success('Cotización eliminada') },
  })

  const statusMutation = useMutation({
    mutationFn: ({ id, status }) => api.patch(`/quotes/${id}/status`, { status }),
    onSuccess: () => qc.invalidateQueries(['quotes']),
  })

  const totalAceptado = quotes.filter(q => q.status === 'accepted').reduce((s, q) => s + q.final_price, 0)

  return (
    <div className="fade-in">
      <PageHeader
        title="Cotizaciones"
        subtitle="Presupuestos y seguimiento de pedidos"
        action={<Btn onClick={() => setModalOpen(true)}><Plus size={16} /> Nueva cotización</Btn>}
      />

      {/* Stats */}
      <div style={{ display: 'grid', gridTemplateColumns: 'repeat(4, 1fr)', gap: '1rem', marginBottom: '1.5rem' }}>
        {[
          ['Total', quotes.length, 'muted'],
          ['Aceptadas', quotes.filter(q => q.status === 'accepted').length, 'success'],
          ['Enviadas', quotes.filter(q => q.status === 'sent').length, 'warning'],
          ['Ingresos', `$${totalAceptado.toLocaleString('es-CL')}`, 'accent'],
        ].map(([label, val, color]) => (
          <Card key={label} style={{ textAlign: 'center', padding: '1rem' }}>
            <div style={{ fontSize: '1.4rem', fontFamily: 'Playfair Display', color: `var(--${color})` }}>{val}</div>
            <div style={{ fontSize: '0.78rem', color: 'var(--muted)', marginTop: '0.2rem' }}>{label}</div>
          </Card>
        ))}
      </div>

      {/* Filtros status */}
      <div style={{ display: 'flex', gap: '0.5rem', marginBottom: '1.5rem' }}>
        {[['Todas', null], ['Borrador', 'draft'], ['Enviadas', 'sent'], ['Aceptadas', 'accepted'], ['Rechazadas', 'rejected']].map(([label, val]) => (
          <button key={label} onClick={() => setStatusFilter(val)} style={{
            padding: '0.35rem 0.9rem', borderRadius: 999, fontSize: '0.8rem', border: '1px solid',
            borderColor: statusFilter === val ? 'var(--accent)' : 'var(--border)',
            background: statusFilter === val ? 'rgba(224,122,95,0.1)' : 'transparent',
            color: statusFilter === val ? 'var(--accent)' : 'var(--muted)', cursor: 'pointer',
          }}>{label}</button>
        ))}
      </div>

      {isLoading ? (
        <div style={{ textAlign: 'center', padding: '3rem' }}><Spinner size={32} /></div>
      ) : quotes.length === 0 ? (
        <EmptyState icon={FileText} title="Sin cotizaciones"
          subtitle="Crea tu primera cotización a partir de una receta"
          action={<Btn onClick={() => setModalOpen(true)}><Plus size={16} /> Nueva cotización</Btn>} />
      ) : (
        <div style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fill, minmax(340px, 1fr))', gap: '1rem' }}>
          {quotes.map(q => (
            <QuoteCard key={q.id} quote={q}
              onDelete={id => deleteMutation.mutate(id)}
              onStatusChange={(id, status) => statusMutation.mutate({ id, status })} />
          ))}
        </div>
      )}

      <NewQuoteModal open={modalOpen} onClose={() => setModalOpen(false)} recipes={recipes} />
    </div>
  )
}
