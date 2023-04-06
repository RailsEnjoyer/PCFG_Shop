class CreateCpus < ActiveRecord::Migration[7.0]
  def change
    create_table :cpus do |t|
      t.string :brand
      t.string :model
      t.float :price
      t.string :socket
      t.integer :core_count
      t.integer :thread_count
      t.float :base_clock
      t.float :boost_clock
      t.integer :tdp
      t.string :compatible_socket
      t.integer :cache

      t.timestamps
    end
  end
end
