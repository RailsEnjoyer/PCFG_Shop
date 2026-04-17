# frozen_string_literal: true

class AddMemoryFrequencyToCpus < ActiveRecord::Migration[7.0]

  def change
    add_column :cpus, :memory_frequency, :integer
  end

end
