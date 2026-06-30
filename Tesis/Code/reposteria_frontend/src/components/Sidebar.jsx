import { NavLink, useNavigate } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { BookOpen, ShoppingBag, FileText, LogOut, Layers } from 'lucide-react'

const links = [
  { to: '/recipes',     icon: BookOpen,    label: 'Recetas'       },
  { to: '/ingredients', icon: ShoppingBag, label: 'Ingredientes'  },
  { to: '/quotes',      icon: FileText,    label: 'Cotizaciones'  },
]

export default function Sidebar() {
  const { user, logout } = useAuth()
  const navigate = useNavigate()

  const handleLogout = () => { logout(); navigate('/login') }

  return (
    <aside style={{
      width: 220,
      minHeight: '100vh',
      background: 'var(--bg2)',
      borderRight: '1px solid var(--border)',
      display: 'flex',
      flexDirection: 'column',
      padding: '2rem 1rem',
      gap: '0.5rem',
      flexShrink: 0,
    }}>
      {/* Logo */}
      <div style={{ marginBottom: '2rem', paddingLeft: '0.5rem' }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: '0.6rem' }}>
          <Layers size={20} color="var(--accent)" />
          <span style={{
            fontFamily: 'Playfair Display, serif',
            fontSize: '1.1rem',
            color: 'var(--accent)',
            fontWeight: 600,
          }}>Repostería</span>
        </div>
        <p style={{ fontSize: '0.75rem', color: 'var(--muted)', marginTop: '0.2rem', paddingLeft: '1.7rem' }}>
          {user?.name}
        </p>
      </div>

      {/* Nav links */}
      {links.map(({ to, icon: Icon, label }) => (
        <NavLink key={to} to={to} style={({ isActive }) => ({
          display: 'flex',
          alignItems: 'center',
          gap: '0.75rem',
          padding: '0.65rem 0.75rem',
          borderRadius: 'var(--radius)',
          color: isActive ? 'var(--accent)' : 'var(--muted)',
          background: isActive ? 'rgba(224,122,95,0.1)' : 'transparent',
          fontWeight: isActive ? 500 : 400,
          fontSize: '0.9rem',
          transition: 'all 0.15s',
        })}>
          <Icon size={17} />
          {label}
        </NavLink>
      ))}

      {/* Logout */}
      <button onClick={handleLogout} style={{
        marginTop: 'auto',
        display: 'flex',
        alignItems: 'center',
        gap: '0.75rem',
        padding: '0.65rem 0.75rem',
        borderRadius: 'var(--radius)',
        background: 'transparent',
        color: 'var(--muted)',
        fontSize: '0.9rem',
        width: '100%',
        textAlign: 'left',
      }}>
        <LogOut size={17} />
        Cerrar sesión
      </button>
    </aside>
  )
}
