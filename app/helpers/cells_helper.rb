module CellsHelper
  # Rendert eine Zelle für die HTML-Tabellen Ansicht
  def render_cell(cell)
    content_tag(:td, '', class: cell.alive ? 'alive' : '')
  end
end
