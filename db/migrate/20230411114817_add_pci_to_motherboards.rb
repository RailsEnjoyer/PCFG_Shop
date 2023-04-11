class AddPciToMotherboards < ActiveRecord::Migration[7.0]
  def change
    add_column :motherboards, :pci, :string
  end
end
