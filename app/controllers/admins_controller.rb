class AdminsController < ApplicationController
  def index
    @orders = Order
              .joins("INNER JOIN billings ON billings.id = orders.billing_id")
              .select(
                "orders.id AS order_id, 
                 orders.quantity, 
                 orders.total_price, 
                 orders.created_at, 
                 billings.fullname, 
                 billings.phone_number, 
                 billings.address"
              )
              .order("orders.created_at DESC")
  end

  def show
  end
end
