class CreateCoolers < ActiveRecord::Migration[7.0]
  def change
    create_table :coolers do |t|
      t.string :brand
      t.string :model
      t.float :price
      t.string :socket
      t.integer :fan_speed
      t.integer :noise_level
      t.integer :max_tdp
      t.string :form_factor
      t.float :rating
      t.string :image

      t.timestamps
    end
  end
end
