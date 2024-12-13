class Billing < ApplicationRecord
  validates :fullname, presence: true
  validates :phone_number, presence: true
  validates :address, presence: true
  has_one_attached :image
  validates :image, presence: true
  has_many :orders
end
