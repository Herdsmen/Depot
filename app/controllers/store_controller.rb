class StoreController < ApplicationController
skip_before_filter :authorize
  def index
    if params[:set_locale]
      redirect_to store_path(:locale => params[:set_locale])
    else
    @products = Product.all
    @cart = current_cart
    end
  end
  
  def get_heat
    if params[:product_id]
      product = Product.find(params[:product_id])
      if product
        render(:text => product.heat )
      end
    end
  end
end