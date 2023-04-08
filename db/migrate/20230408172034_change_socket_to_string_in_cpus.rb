class ChangeSocketToStringInCpus < ActiveRecord::Migration[7.0]
  def change
    change_column :cpus, :socket, :string
  end
end
