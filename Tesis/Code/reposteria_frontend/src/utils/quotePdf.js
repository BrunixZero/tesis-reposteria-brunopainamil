// Genera el PDF de una cotización en el navegador (sin tocar el backend).
// Usa los datos que la API ya entrega: los precios son los guardados al crear
// la cotización, así que el PDF no cambia aunque después se edite un precio.
const CLP = new Intl.NumberFormat('es-CL', { maximumFractionDigits: 0 })
const NUM = new Intl.NumberFormat('es-CL', { maximumFractionDigits: 2 })
const money = n => `$${CLP.format(Math.round(n || 0))}`
const unitMoney = n => `$${NUM.format(n || 0)}`

const ESTADOS = { draft: 'Borrador', sent: 'Enviada', accepted: 'Aceptada', rejected: 'Rechazada' }

export function nombreArchivoCotizacion(q) {
  const limpio = s => (s || '').normalize('NFD').replace(/[̀-ͯ]/g, '')
    .replace(/[^a-zA-Z0-9]+/g, '_').replace(/^_|_$/g, '')
  const partes = ['Cotizacion', limpio(q.recipe_name), limpio(q.client_name)].filter(Boolean)
  return `${partes.join('_')}.pdf`
}

export async function descargarCotizacionPDF(q) {
  // Carga diferida: las librerías solo se descargan al usar el botón
  const [{ jsPDF }, autoTableMod] = await Promise.all([import('jspdf'), import('jspdf-autotable')])
  // Según el empaquetador, la función puede venir en .default o en .default.default
  const autoTable = typeof autoTableMod.default === 'function' ? autoTableMod.default : autoTableMod.default?.default

  const doc = new jsPDF({ unit: 'mm', format: 'a4' })
  const W = doc.internal.pageSize.getWidth()
  const M = 16
  const ACCENT = [224, 122, 95]
  const DARK = [45, 45, 55]
  const MUTED = [120, 120, 130]

  // Encabezado
  doc.setFillColor(...ACCENT)
  doc.rect(0, 0, W, 28, 'F')
  doc.setTextColor(255, 255, 255)
  doc.setFont('helvetica', 'bold'); doc.setFontSize(20)
  doc.text('Cotización', M, 17)
  doc.setFont('helvetica', 'normal'); doc.setFontSize(10)
  const nro = (q.id || '').toString().slice(0, 8).toUpperCase()
  const fecha = q.created_at ? new Date(q.created_at) : new Date()
  doc.text(`N° ${nro}`, W - M, 13, { align: 'right' })
  doc.text(fecha.toLocaleDateString('es-CL', { day: '2-digit', month: 'long', year: 'numeric' }), W - M, 20, { align: 'right' })

  // Datos generales
  let y = 40
  doc.setTextColor(...DARK)
  const fila = (etq, val) => {
    doc.setFont('helvetica', 'bold'); doc.setFontSize(10); doc.setTextColor(...MUTED)
    doc.text(etq, M, y)
    doc.setFont('helvetica', 'normal'); doc.setTextColor(...DARK)
    doc.text(String(val), M + 38, y)
    y += 6.5
  }
  fila('Producto', q.recipe_name)
  if (q.client_name) fila('Cliente', q.client_name)
  if (q.client_email) fila('Correo', q.client_email)
  fila('Porciones', q.servings_requested)
  fila('Estado', ESTADOS[q.status] || q.status)

  // Detalle de ingredientes
  y += 4
  autoTable(doc, {
    startY: y,
    head: [['Ingrediente', 'Cantidad', 'Precio unitario', 'Subtotal']],
    body: (q.items || []).map(i => [
      i.ingredient_name,
      `${NUM.format(i.quantity_needed)} ${i.unit}`,
      `${unitMoney(i.unit_cost)} / ${i.unit}`,
      money(i.subtotal),
    ]),
    theme: 'striped',
    styles: { font: 'helvetica', fontSize: 9.5, cellPadding: 2.6, textColor: DARK },
    headStyles: { fillColor: DARK, textColor: 255, fontStyle: 'bold' },
    alternateRowStyles: { fillColor: [247, 244, 241] },
    columnStyles: {
      1: { halign: 'right' }, 2: { halign: 'right' }, 3: { halign: 'right', fontStyle: 'bold' },
    },
    didParseCell: d => { if (d.section === 'head' && d.column.index > 0) d.cell.styles.halign = 'right' },
    margin: { left: M, right: M },
  })

  // Resumen de costos
  const costo = q.ingredient_cost || 0
  const conIndirectos = costo * (1 + (q.overhead_pct || 0) / 100)
  const montoIndirectos = conIndirectos - costo
  const montoMargen = (q.final_price || 0) - conIndirectos

  y = doc.lastAutoTable.finalY + 8
  if (y > 235) { doc.addPage(); y = 20 }
  const xEtq = W - M - 80
  const linea = (etq, val, opts = {}) => {
    doc.setFont('helvetica', opts.bold ? 'bold' : 'normal')
    doc.setFontSize(opts.size || 10)
    doc.setTextColor(...(opts.color || DARK))
    doc.text(etq, xEtq, y)
    doc.text(val, W - M, y, { align: 'right' })
    y += opts.gap || 6.5
  }
  linea('Costo de ingredientes', money(costo))
  linea(`Gastos indirectos (${NUM.format(q.overhead_pct)}%)`, money(montoIndirectos))
  linea(`Margen de ganancia (${NUM.format(q.margin_pct)}%)`, money(montoMargen), { gap: 4 })
  doc.setDrawColor(...ACCENT); doc.setLineWidth(0.6)
  doc.line(xEtq, y, W - M, y); y += 7
  linea('TOTAL', money(q.final_price), { bold: true, size: 14, color: ACCENT, gap: 8 })

  // Notas
  if (q.notes) {
    if (y > 255) { doc.addPage(); y = 20 }
    y += 4
    doc.setFont('helvetica', 'bold'); doc.setFontSize(10); doc.setTextColor(...MUTED)
    doc.text('Observaciones', M, y); y += 5.5
    doc.setFont('helvetica', 'normal'); doc.setTextColor(...DARK)
    doc.text(doc.splitTextToSize(q.notes, W - 2 * M), M, y)
  }

  // Pie de página en todas las hojas
  const n = doc.internal.getNumberOfPages()
  for (let p = 1; p <= n; p++) {
    doc.setPage(p)
    const H = doc.internal.pageSize.getHeight()
    doc.setFont('helvetica', 'normal'); doc.setFontSize(8); doc.setTextColor(...MUTED)
    doc.text('Cotización referencial. Los valores corresponden a los precios de ingredientes vigentes al momento de crear la cotización.', M, H - 10)
    doc.text(`Página ${p} de ${n}`, W - M, H - 10, { align: 'right' })
  }

  doc.save(nombreArchivoCotizacion(q))
}
