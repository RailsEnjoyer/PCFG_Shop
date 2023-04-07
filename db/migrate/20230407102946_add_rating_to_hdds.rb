class AddRatingToHdds < ActiveRecord::Migration[7.0]
  def change
    add_column :hdds, :rating, :float
  end
end
