class Order < ApplicationRecord
  has_one_attached :slip
end
