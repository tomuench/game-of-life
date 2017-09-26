# Zelle auf dem Spielfeld
class Cell < ApplicationRecord
  # Scopes
  scope :row, ->(row_id) { where(y: row_id) }
  scope :alive, ->() { where(alive: true) }
  scope :without, ->(cell) { where.not(x: cell.x, y: cell.y) }

  # Beziehungen
  belongs_to :game

  # Validierungen
  validates :x, presence: true
  validates :y, presence: true

  # Callbacks
  before_create :set_random_alive

  # Temporäre Variablen
  attr_accessor :random_alive

  # Ändert den Lebensstatus
  def life_toggle
    self.alive = !self.alive
    save
  end

  def neighbours_living
    game.cells.alive.where("x between #{x - 1} and #{x + 1} or x in (#{(x-1) % game.width},#{(x+1) % game.width})")
        .where("y between #{y - 1} and #{y + 1} or y in (#{(y-1) % game.height},#{(y+1) % game.height})")
        .without(self)
  end

  def next_round_alive
    neighboars_count = neighbours_living.count
    !(neighboars_count < 2 || neighboars_count > 3)
  end

  def to_s
    "#{alive ? 'X' : ' '}"
  end

  def self.bulk_update(next_round_states)
    next_round_states.each do |cell, alive|
      cell.update_attributes(alive: alive)
    end
  end

  private

  def set_random_alive
    return unless random_alive
    self.alive = Random.new.rand(100) % 3 == 0
  end
end
