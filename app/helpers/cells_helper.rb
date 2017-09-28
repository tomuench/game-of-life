module CellsHelper
  # Rendert eine Zelle für die HTML-Tabellen Ansicht
  def render_cell(cell)
    content_tag(:td, '', 
                id: "cell#{cell.id}", 
                onclick: "toggleCell(this,#{cell.id})",
                class: cell.alive ? 'alive cell' : 'cell')
  end
end
