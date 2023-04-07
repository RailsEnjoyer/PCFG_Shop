class AddRatingToGpus < ActiveRecord::Migration[7.0]
  def change
    add_column :gpus, :rating, :float
  end
end
