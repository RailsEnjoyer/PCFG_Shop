class CreateSsds < ActiveRecord::Migration[7.0]
  def change
    create_table :ssds do |t|
      t.string :brand
      t.string :model
      t.integer :capacity
      t.float :price
      t.string :interface
      t.string :form_factor
      t.integer :read_speed
      t.integer :write_speed
      t.string :compatible_interface

      t.timestamps
    end
  end
end
