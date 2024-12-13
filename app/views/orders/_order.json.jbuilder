json.extract! order, :id, :fullname, :phone_number, :address, :total_price, :promotion_id, :created_at, :updated_at
json.url order_url(order, format: :json)
