class AddModelToRams < ActiveRecord::Migration[7.0]
  def change
    add_column :rams, :model, :string
  end
end
