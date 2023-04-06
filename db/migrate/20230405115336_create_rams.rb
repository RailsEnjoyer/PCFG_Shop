class CreateRams < ActiveRecord::Migration[7.0]
  def change
    create_table :rams do |t|
      t.integer :memory
      t.integer :memory_speed
      t.string :brand
      t.float :price
      t.string :memory_type
      t.integer :timings
      t.float :voltage

      t.timestamps
    end
  end
end
