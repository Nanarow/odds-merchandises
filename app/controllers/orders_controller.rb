class OrdersController < ApplicationController
  def index
    @products = session[:products] || {}
    puts @products
    @billing = Billing.new
    total_price = 0
    @products.each do |product_id, quantity|
      p = Product.find(product_id)
      total_price += p.price * quantity.to_i
    end
    @billing.total_price = total_price

  end

  def show
  end
  def update
  end
  def destroy
  end


  # POST /billings or /billings.json
  def create
    @billing = Billing.new(billing_params)


    products = session[:products] || {}

    respond_to do |format|
      if @billing.save
        products.each do |product_id, quantity|
          if quantity.to_i > 0
            p = Product.find(product_id.to_i)
            total = p.price * quantity.to_i
            Order.create!(product_id: product_id.to_i, quantity: quantity.to_i, total_price: total, billing_id: @billing.id)
          end
        end
        format.html { redirect_to orders_path, notice: "Billing was successfully created." }
      else
        format.html { redirect_to orders_path, alert: @billing.errors.full_messages }
      end
    end
  end

  # PATCH/PUT /billings/1 or /billings/1.json

  # DELETE /billings/1 or /billings/1.json


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_billing
      @billing = Billing.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def billing_params
      params.expect(billing: [ :fullname, :phone_number, :address, :total_price, :promotion_id ])
    end
end
