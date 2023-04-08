class ChangeFormFactorToStringInRigs < ActiveRecord::Migration[7.0]
  def change
    change_column :rigs, :form_factor, :string
  end
end
