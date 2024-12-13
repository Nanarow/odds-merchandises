class OrdersController < ApplicationController
  def index
    @orders = session[:products] || {}
    product_ids = @orders.select { |_, quantity| quantity.to_i != 0 }.keys.map(&:to_i)
    @products_records = Product.where(id: product_ids)
    @product_quantities = @products_records.map do |product|
      { product: product, quantity: @orders[product.id.to_s].to_i, total_price: product.price * @orders[product.id.to_s].to_i}
    end
    @billing = Billing.new
    total_price = 0
    @orders.each do |product_id, quantity|
      product = @products_records.find { |p| p.id == product_id.to_i }
      total_price += product.price * quantity.to_i if product
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

        flash[:success] = "ชำระเงินสำเร็จ" # Success message
        format.html { redirect_to orders_path } # Redirect after successful payment
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
