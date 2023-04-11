class AddMemoryClockToMotherboards < ActiveRecord::Migration[7.0]
  def change
    add_column :motherboards, :memory_clock, :integer
  end
end
