class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :age, :integer
    add_column :users, :country, :string
    add_column :users, :payment_method, :string
  end
end
