class CreateMotherboards < ActiveRecord::Migration[7.0]
  def change
    create_table :motherboards do |t|
      t.string :brand
      t.string :model
      t.float :price
      t.string :chipset
      t.string :form_factor
      t.integer :memory_slots
      t.integer :max_memory
      t.string :memory_type
      t.string :socket
      t.string :compatible_cpu

      t.timestamps
    end
  end
end
