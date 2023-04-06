class AddImageToRams < ActiveRecord::Migration[7.0]
  def change
    add_column :rams, :image, :string
  end
end
