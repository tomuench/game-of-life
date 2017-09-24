class Game < ApplicationRecord
  has_many :cells

  after_create :build_field
  after_update :reset_field

  def rows
    (0..height).map { |row_id| cells[row_id * width...(row_id+1) * width] }
  end

  # Überführe das Spiel in die nächste Runde
  def next_round
    Game.transaction do
      next_evo = {}
      cells.each do |cell|
        next_evo[cell] = cell.next_round_alive
      end
      Cell.bulk_update(next_evo)
    end
  end

  private

  # Löscht das Feld und erzeugt es neu
  def reset_field
    cells.delete_all
    build_field
  end

  # Baut das Spielfeld neu auf
  def build_field
    (0..height).each do |row_id|
      build_row(row_id)
    end
  end

  def build_row(row_id)
    (0..width).each do |col_id|
      cells.create(y: row_id, x: col_id)
    end
  end
end
