class AddWriteResourceToSsds < ActiveRecord::Migration[7.0]
  def change
    add_column :ssds, :write_resource, :integer
  end
end
