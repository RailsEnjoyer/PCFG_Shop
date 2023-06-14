class User < ApplicationRecord
  has_secure_password
  before_save :downcase_nickname
  has_one :cart

  validates :email, presence: true, uniqueness: true

  def create_cart
    self.create_cart!
  end

  def downcase_nickname
    nickname.downcase!
  end
end
