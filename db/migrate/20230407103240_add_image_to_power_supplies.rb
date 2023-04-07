class AddImageToPowerSupplies < ActiveRecord::Migration[7.0]
  def change
    add_column :power_supplies, :image, :string
  end
end
