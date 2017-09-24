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

  def neighboars
    # TODO: Ränder beachten
    game.cells_cached.where("x between #{x - 1} and #{x + 1} or x = #{x % game.width}")
        .where("y between #{y - 1} and #{y + 1} or y = #{y % game.height}")
        .without(self)
  end

  def next_round_alive
    neighboars_count = neighboars.count
    !(neighboars_count < 2 || neighboars_count > 3)
  end

  def to_s
    "x: #{x}, y:#{y}, alive:#{alive}"
  end

  def self.bulk_update(next_round_states)
    next_round_states.each do |cell, alive|
      cell.update_attributes(alive: alive)
    end
  end

  private

  def set_random_alive
    self.alive = Random.new.rand(100) % 3 == 0
  end
end
