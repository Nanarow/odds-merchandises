class ProductsController < ApplicationController
  def index
    @products = Product.all
  end      
  def pass
    permitted_params = params.permit(products: {})
    puts permitted_params.to_h
    session[:products] = permitted_params[:products].to_h
    puts session[:products]
    redirect_to billings_path
  end
 
  def show
    
  end
  def update
    
  end
  def destroy
    
  end
end
