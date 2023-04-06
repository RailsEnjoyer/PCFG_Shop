class AddRatingToRams < ActiveRecord::Migration[7.0]
  def change
    add_column :rams, :rating, :integer
  end
end
