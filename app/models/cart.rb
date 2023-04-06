class Cart < ApplicationRecord
  has_many :line_items

  def add_ram(ram)
    current_item = line_items.find_by(ram_id: ram.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(ram_id: ram.id)
    end
    current_item
  end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
