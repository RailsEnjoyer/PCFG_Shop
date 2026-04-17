# frozen_string_literal: true

class Component < ApplicationRecord

  has_one_attached :image
  has_many :line_items

end
