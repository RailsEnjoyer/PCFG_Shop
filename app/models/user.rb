class User < ApplicationRecord
  has_secure_password
  has_one_attached :image
  before_save :downcase_nickname
  has_one :cart

  validates :email, presence: true, uniqueness: true

  def downcase_nickname
    nickname.downcase!
  end
end
