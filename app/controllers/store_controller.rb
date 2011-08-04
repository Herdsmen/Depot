class StoreController < ApplicationController
	skip_before_filter :authorize
	
	def index
		if params[:set_locale]
			redirect_to store_path(:locale => params[:set_locale])
		else
			unless params[:category] then @products = Product.all
			else @products = Product.getProductsByCategoryID params[:category] end
			
			@cart = current_cart
			# @params = params.to_hash
		end
	end
end