class LineItem < ApplicationRecord
  belongs_to :component
  belongs_to :cart
end
