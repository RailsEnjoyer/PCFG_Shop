# frozen_string_literal: true

class AddBusWidthToGpus < ActiveRecord::Migration[7.0]

  def change
    add_column :gpus, :bus_width, :integer
  end

end
