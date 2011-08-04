module ProductsHelper
	def	categoriesToString(product)
		nameArray = Array.new
		product.getCategories.each do | category |
			# return category.methods
			nameArray << category.name
		end
		
		nameArray.join(",")
	end
end
