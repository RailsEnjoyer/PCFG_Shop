class CreateComponents < ActiveRecord::Migration[7.0]
  def change
    create_table :components do |t|
      t.text :title
      t.text :description
      t.integer :user_id, index: true
      t.text :country
      t.text :brand
      t.datetime :market_date
      t.text :size
      t.text :connectors
      t.integer :guarantee
      t.text :complete_set
      t.float :rating
      t.integer :weight
      t.float :price
      t.boolean :availability

      t.timestamps
    end
  end
end
