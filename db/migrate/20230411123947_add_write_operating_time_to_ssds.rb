class AddWriteOperatingTimeToSsds < ActiveRecord::Migration[7.0]
  def change
    add_column :ssds, :operating_time, :integer
  end
end
