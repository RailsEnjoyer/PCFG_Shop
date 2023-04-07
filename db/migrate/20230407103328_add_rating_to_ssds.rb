class AddRatingToSsds < ActiveRecord::Migration[7.0]
  def change
    add_column :ssds, :rating, :float
  end
end
