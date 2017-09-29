module CellsHelper
  # Rendert eine Zelle für die HTML-Tabellen Ansicht
  def render_cell(cell)
    content_tag(:td, '', 
                'data-id' => cell.id,
                class: cell.alive ? 'alive cell' : 'cell')
  end
end
