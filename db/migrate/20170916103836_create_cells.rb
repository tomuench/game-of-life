class CreateCells < ActiveRecord::Migration[5.1]
  def change
    create_table :cells do |t|
      t.integer :x
      t.integer :y
      t.references :game, foreign_key: true
      t.boolean :alive, default: false
      t.timestamps
    end
  end
end
