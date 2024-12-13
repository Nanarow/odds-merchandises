class OrdersController < ApplicationController
  def index
    @p = session[:products] || {}
    puts @p
    @billing = Billing.new
    @products = Product.all
    @orders = [
      { quantity: 2, total_price: 500.0, product_id: 1 },
      { quantity: 1, total_price: 150.0, product_id: 2 },
      { quantity: 5, total_price: 1250.0, product_id: 3 }
    ]
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

    respond_to do |format|
      if @billing.save
        format.html { redirect_to @billing, notice: "Billing was successfully created." }
        format.json { render :show, status: :created, location: @billing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @billing.errors, status: :unprocessable_entity }
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
