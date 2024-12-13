json.extract! billing, :id, :fullname, :phone_number, :address, :total_price, :promotion_id, :created_at, :updated_at
json.url billing_url(billing, format: :json)
