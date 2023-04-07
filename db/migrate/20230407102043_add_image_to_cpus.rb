class AddImageToCpus < ActiveRecord::Migration[7.0]
  def change
    add_column :cpus, :image, :string
  end
end
