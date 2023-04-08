class ChangeSocketToStringInCoolers < ActiveRecord::Migration[7.0]
  def change
    change_column :coolers, :socket, :string
  end
end
