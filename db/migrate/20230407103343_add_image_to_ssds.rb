class AddImageToSsds < ActiveRecord::Migration[7.0]
  def change
    add_column :ssds, :image, :string
  end
end
