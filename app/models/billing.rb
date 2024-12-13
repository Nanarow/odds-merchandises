class Billing < ApplicationRecord
  belongs_to :promotion
  has_many :orders
end
