class Order < ApplicationRecord
  belongs_to :billing
  belongs_to :product
end
