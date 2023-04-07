class AddRatingToMotherboards < ActiveRecord::Migration[7.0]
  def change
    add_column :motherboards, :rating, :float
  end
end
