class StoreController < ApplicationController

  def index
    if params[:set_locale]
      redirect_to store_path(:locale => params[:set_locale])
    else
    @products = Product.all
    @cart = current_cart
    @topten = Product.get_top_five
    @is_user=is_user?
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
  
  
  private
  def is_user?
     check_role_type=='User'
  end
  
end