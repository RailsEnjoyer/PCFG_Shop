class AddRatingToPowerSupplies < ActiveRecord::Migration[7.0]
  def change
    add_column :power_supplies, :rating, :float
  end
end
