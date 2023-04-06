class CreatePowerSupplies < ActiveRecord::Migration[7.0]
  def change
    create_table :power_supplies do |t|
      t.string :brand
      t.string :model
      t.integer :wattage
      t.string :efficiency
      t.float :price
      t.string :form_factor

      t.timestamps
    end
  end
end
