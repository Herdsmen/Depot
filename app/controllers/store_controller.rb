class StoreController < ApplicationController

	
	def index
		if params[:set_locale]
			redirect_to store_path(:locale => params[:set_locale])
		else
			unless params[:category] then @products = Product.all
			else @products = Product.getProductsByCategoryID(params[:category]) end
			
			@products = @products.paginate :page => params[:page], :per_page => 5
			
			@cart = current_cart
			@topfive = Product.get_top_five
			@is_user=is_user?
		end
	end
  
	def get_heat
		if params[:product_id]
			product = Product.find(params[:product_id])
		
			if product then render(:text => product.heat ) end
		end
	end
  
	def books
		@products = Product.all.paginate :page => params[:page], :per_page => 12
	end
  
	private
	def is_user?
		check_role_type=='User'
	end
end