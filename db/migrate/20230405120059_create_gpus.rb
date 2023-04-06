class CreateGpus < ActiveRecord::Migration[7.0]
  def change
    create_table :gpus do |t|
      t.string :brand
      t.string :model
      t.float :price
      t.integer :memory
      t.float :core_clock
      t.float :boost_clock
      t.integer :tdp
      t.string :memory_type
      t.string :interface
      t.string :compatible_interface

      t.timestamps
    end
  end
end
