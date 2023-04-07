class AddImageToMotherboards < ActiveRecord::Migration[7.0]
  def change
    add_column :motherboards, :image, :string
  end
end
