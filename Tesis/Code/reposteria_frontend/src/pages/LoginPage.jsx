import { useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import api from '../services/api'
import toast from 'react-hot-toast'
import { Layers } from 'lucide-react'

export default function LoginPage() {
  const [mode, setMode] = useState('login') // 'login' | 'register'
  const [form, setForm] = useState({ name: '', email: '', password: '' })
  const [loading, setLoading] = useState(false)
  const { login } = useAuth()
  const navigate = useNavigate()

  const set = (k) => (e) => setForm(f => ({ ...f, [k]: e.target.value }))

  const handleSubmit = async () => {
    setLoading(true)
    try {
      if (mode === 'register') {
        await api.post('/auth/register', { name: form.name, email: form.email, password: form.password })
        toast.success('Cuenta creada, ahora ingresa')
        setMode('login')
      } else {
        await login(form.email, form.password)
        navigate('/recipes')
      }
    } catch (e) {
      toast.error(e.response?.data?.detail || 'Error al procesar')
    } finally {
      setLoading(false)
    }
  }

  return (
    <div style={{
      minHeight: '100vh', display: 'flex', alignItems: 'center', justifyContent: 'center',
      background: 'var(--bg)',
      backgroundImage: 'radial-gradient(ellipse at 20% 50%, rgba(224,122,95,0.06) 0%, transparent 60%)',
    }}>
      <div style={{
        width: '100%', maxWidth: 400,
        background: 'var(--bg2)',
        border: '1px solid var(--border)',
        borderRadius: 'var(--radius-lg)',
        padding: '2.5rem',
        animation: 'fadeIn 0.4s ease',
      }}>
        {/* Logo */}
        <div style={{ textAlign: 'center', marginBottom: '2rem' }}>
          <div style={{ display: 'inline-flex', alignItems: 'center', gap: '0.5rem', marginBottom: '0.5rem' }}>
            <Layers size={24} color="var(--accent)" />
            <span style={{ fontFamily: 'Playfair Display, serif', fontSize: '1.4rem', color: 'var(--accent)' }}>
              Repostería
            </span>
          </div>
          <p style={{ color: 'var(--muted)', fontSize: '0.85rem' }}>
            {mode === 'login' ? 'Bienvenido de vuelta' : 'Crea tu cuenta'}
          </p>
        </div>

        {/* Form */}
        <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
          {mode === 'register' && (
            <div>
              <label style={{ fontSize: '0.82rem', color: 'var(--muted)', display: 'block', marginBottom: '0.4rem' }}>
                Nombre
              </label>
              <input placeholder="Tu nombre" value={form.name} onChange={set('name')} />
            </div>
          )}
          <div>
            <label style={{ fontSize: '0.82rem', color: 'var(--muted)', display: 'block', marginBottom: '0.4rem' }}>
              Email
            </label>
            <input type="email" placeholder="tu@email.cl" value={form.email} onChange={set('email')} />
          </div>
          <div>
            <label style={{ fontSize: '0.82rem', color: 'var(--muted)', display: 'block', marginBottom: '0.4rem' }}>
              Contraseña
            </label>
            <input type="password" placeholder="••••••••" value={form.password} onChange={set('password')}
              onKeyDown={e => e.key === 'Enter' && handleSubmit()} />
          </div>

          <button onClick={handleSubmit} disabled={loading} style={{
            marginTop: '0.5rem',
            background: 'var(--accent)',
            color: '#fff',
            padding: '0.75rem',
            borderRadius: 'var(--radius)',
            fontWeight: 600,
            fontSize: '0.95rem',
            opacity: loading ? 0.7 : 1,
            cursor: loading ? 'not-allowed' : 'pointer',
            border: 'none',
          }}>
            {loading ? 'Cargando...' : mode === 'login' ? 'Ingresar' : 'Crear cuenta'}
          </button>

          <p style={{ textAlign: 'center', fontSize: '0.85rem', color: 'var(--muted)' }}>
            {mode === 'login' ? '¿No tienes cuenta? ' : '¿Ya tienes cuenta? '}
            <span onClick={() => setMode(mode === 'login' ? 'register' : 'login')}
              style={{ color: 'var(--accent)', cursor: 'pointer' }}>
              {mode === 'login' ? 'Regístrate' : 'Inicia sesión'}
            </span>
          </p>
        </div>
      </div>
    </div>
  )
}
