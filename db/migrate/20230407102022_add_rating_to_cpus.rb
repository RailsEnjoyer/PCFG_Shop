class AddRatingToCpus < ActiveRecord::Migration[7.0]
  def change
    add_column :cpus, :rating, :float
  end
end
