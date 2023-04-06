class CreateRigs < ActiveRecord::Migration[7.0]
  def change
    create_table :rigs do |t|
      t.string :brand
      t.string :model
      t.float :rating
      t.string :image
      t.string :form_factor
      t.string :drive_bays
      t.float :price

      t.timestamps
    end
  end
end
