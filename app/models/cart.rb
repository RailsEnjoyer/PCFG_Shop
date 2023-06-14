class Cart < ApplicationRecord
    belongs_to :user
    has_many :line_items, dependent: :destroy

    def add_component(component)
        line_item = line_items.find_by(component_id: component.id)
        if line_item
          line_item.quantity += 1
        else
          line_item = line_items.build(component_id: component.id)
        end
        line_item.save
    end
end
