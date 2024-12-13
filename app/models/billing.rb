class Billing < ApplicationRecord
  # belongs_to :promotion
  has_one_attached :image
  has_many :orders
end
