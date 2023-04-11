class ChangeChipsetTypeInMotherboards < ActiveRecord::Migration[7.0]
  def change
    change_column :motherboards, :chipset, :string
  end
end
