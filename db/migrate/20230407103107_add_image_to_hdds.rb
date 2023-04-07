class AddImageToHdds < ActiveRecord::Migration[7.0]
  def change
    add_column :hdds, :image, :string
  end
end
