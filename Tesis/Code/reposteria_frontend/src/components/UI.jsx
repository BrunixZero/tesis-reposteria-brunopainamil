// ── Button ────────────────────────────────────────────────────
export function Btn({ children, variant = 'primary', size = 'md', ...props }) {
  const styles = {
    primary: { background: 'var(--accent)', color: '#fff' },
    secondary: { background: 'var(--bg3)', color: 'var(--text)', border: '1px solid var(--border)' },
    danger: { background: 'var(--danger)', color: '#fff' },
    ghost: { background: 'transparent', color: 'var(--muted)' },
  }
  const sizes = {
    sm: { padding: '0.4rem 0.85rem', fontSize: '0.82rem' },
    md: { padding: '0.6rem 1.2rem', fontSize: '0.9rem' },
    lg: { padding: '0.8rem 1.6rem', fontSize: '1rem' },
  }
  return (
    <button style={{
      ...styles[variant],
      ...sizes[size],
      borderRadius: 'var(--radius)',
      fontWeight: 500,
      display: 'inline-flex',
      alignItems: 'center',
      gap: '0.4rem',
      opacity: props.disabled ? 0.5 : 1,
      cursor: props.disabled ? 'not-allowed' : 'pointer',
      border: styles[variant].border || 'none',
      transition: 'opacity 0.15s, transform 0.1s',
    }}
    onMouseEnter={e => { if (!props.disabled) e.currentTarget.style.opacity = '0.85' }}
    onMouseLeave={e => { if (!props.disabled) e.currentTarget.style.opacity = '1' }}
    {...props}>
      {children}
    </button>
  )
}

// ── Card ─────────────────────────────────────────────────────
export function Card({ children, style = {} }) {
  return (
    <div style={{
      background: 'var(--bg2)',
      border: '1px solid var(--border)',
      borderRadius: 'var(--radius-lg)',
      padding: '1.5rem',
      ...style,
    }}>
      {children}
    </div>
  )
}

// ── Badge ────────────────────────────────────────────────────
export function Badge({ children, color = 'accent' }) {
  const colors = {
    accent:  { bg: 'rgba(224,122,95,0.15)',  text: 'var(--accent)'  },
    success: { bg: 'rgba(129,178,154,0.15)', text: 'var(--success)' },
    warning: { bg: 'rgba(242,204,143,0.15)', text: 'var(--accent2)' },
    danger:  { bg: 'rgba(193,102,107,0.15)', text: 'var(--danger)'  },
    muted:   { bg: 'rgba(138,128,116,0.15)', text: 'var(--muted)'   },
  }
  const c = colors[color] || colors.muted
  return (
    <span style={{
      background: c.bg,
      color: c.text,
      borderRadius: '999px',
      padding: '0.2rem 0.7rem',
      fontSize: '0.75rem',
      fontWeight: 500,
    }}>
      {children}
    </span>
  )
}

// ── Spinner ──────────────────────────────────────────────────
export function Spinner({ size = 24 }) {
  return (
    <div style={{
      width: size, height: size,
      border: '2px solid var(--border)',
      borderTop: '2px solid var(--accent)',
      borderRadius: '50%',
      animation: 'spin 0.7s linear infinite',
      display: 'inline-block',
    }} />
  )
}

// ── PageHeader ───────────────────────────────────────────────
export function PageHeader({ title, subtitle, action }) {
  return (
    <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'flex-start', marginBottom: '2rem' }}>
      <div>
        <h1 style={{ fontSize: '1.8rem', color: 'var(--text)' }}>{title}</h1>
        {subtitle && <p style={{ color: 'var(--muted)', marginTop: '0.25rem', fontSize: '0.9rem' }}>{subtitle}</p>}
      </div>
      {action}
    </div>
  )
}

// ── Modal ────────────────────────────────────────────────────
export function Modal({ open, onClose, title, children, width = 500 }) {
  if (!open) return null
  return (
    <div onClick={onClose} style={{
      position: 'fixed', inset: 0,
      background: 'rgba(0,0,0,0.7)',
      display: 'flex', alignItems: 'flex-start', justifyContent: 'center', paddingTop: '2rem',
      zIndex: 1000, padding: '1rem',
    }}>
      <div onClick={e => e.stopPropagation()} style={{
        background: 'var(--bg2)',
        border: '1px solid var(--border)',
        borderRadius: 'var(--radius-lg)',
        padding: '2rem',
        width: '100%',
        maxWidth: width,
        maxHeight: '90vh',
        overflowY: 'auto',
        animation: 'fadeIn 0.2s ease',
      }}>
        <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '1.5rem' }}>
          <h2 style={{ fontSize: '1.3rem' }}>{title}</h2>
          <button onClick={onClose} style={{ background: 'none', color: 'var(--muted)', fontSize: '1.4rem', lineHeight: 1 }}>×</button>
        </div>
        {children}
      </div>
    </div>
  )
}

// ── FormField ────────────────────────────────────────────────
export function FormField({ label, children }) {
  return (
    <div style={{ display: 'flex', flexDirection: 'column', gap: '0.4rem' }}>
      <label style={{ fontSize: '0.82rem', color: 'var(--muted)', fontWeight: 500 }}>{label}</label>
      {children}
    </div>
  )
}

// ── EmptyState ───────────────────────────────────────────────
export function EmptyState({ icon: Icon, title, subtitle, action }) {
  return (
    <div style={{ textAlign: 'center', padding: '4rem 2rem', color: 'var(--muted)' }}>
      {Icon && <Icon size={48} style={{ marginBottom: '1rem', opacity: 0.4 }} />}
      <h3 style={{ fontSize: '1.1rem', color: 'var(--text)', marginBottom: '0.5rem' }}>{title}</h3>
      {subtitle && <p style={{ fontSize: '0.9rem', marginBottom: '1.5rem' }}>{subtitle}</p>}
      {action}
    </div>
  )
}
