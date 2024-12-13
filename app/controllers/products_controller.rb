class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def pass
    puts(params)
    redirect_to orders_path(params)
  end
  def show
    
  end
  def update
    
  end
  def destroy
    
  end
end
