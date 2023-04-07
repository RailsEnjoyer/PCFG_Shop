class AddImageToGpus < ActiveRecord::Migration[7.0]
  def change
    add_column :gpus, :image, :string
  end
end
