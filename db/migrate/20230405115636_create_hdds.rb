class CreateHdds < ActiveRecord::Migration[7.0]
  def change
    create_table :hdds do |t|
      t.string :brand
      t.string :model
      t.integer :capacity
      t.float :price
      t.string :interface
      t.string :form_factor
      t.integer :rpm
      t.string :compatible_interface
      t.integer :speed

      t.timestamps
    end
  end
end
