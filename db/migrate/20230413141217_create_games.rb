class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :title
      t.text :description
      t.date :release_date
      t.integer :req_cpu_core_count
      t.integer :req_cpu_thread_count
      t.float :req_cpu_clock
      t.integer :req_cpu_cache
      t.integer :req_gpu_memory
      t.float :req_gpu_core_clock
      t.integer :req_gpu_bus_width
      t.integer :req_hdd_capacity
      t.integer :req_ram_memory
      t.integer :req_ssd_capacity

      t.timestamps
    end
  end
end
