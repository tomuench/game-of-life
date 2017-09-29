# Ein Spiel im GameOfLife
class Game < ApplicationRecord
  # Beziehungen
  has_many :cells, dependent: :delete_all

  # Callbacks
  after_create :build_field
  after_update :reset_field

  # Temporaere Variablen
  attr_accessor :random_build

  # Validierung
  validates :height, numericality: { only_integer: true, greater_than: 0 }
  validates :width, numericality: { only_integer: true, greater_than: 0 }
  validates :name, presence: true

  # Zellen als Zeilen aufrufen
  def rows
    cells_ordered = cells.order(:y => :desc)
    (0..height).map { |row_id| cells.where(y: row_id) }
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

  def to_s
    ret_value = ''
    (0...height).each do |row|
      cells.where(y: row).order(:x).each do |cell|
        ret_value += cell.to_s
      end
      ret_value += "\r\n"
    end
    ret_value
  end

  private

  # Löscht das Feld und erzeugt es neu
  def reset_field
    cells.delete_all
    build_field
  end

  # Baut das Spielfeld neu auf
  def build_field
    return unless random_build
    (0..height).each do |row_id|
      build_row(row_id)
    end
  end

  # Initieren der Zellen beim Erstellen
  def build_row(row_id)
    (0..width).each do |col_id|
      cells.create(y: row_id, x: col_id, random_alive: true)
    end
  end
end
