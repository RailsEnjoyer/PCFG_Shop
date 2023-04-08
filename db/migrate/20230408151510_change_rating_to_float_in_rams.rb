class ChangeRatingToFloatInRams < ActiveRecord::Migration[7.0]
  def change
    change_column :rams, :rating, :float
  end
end
