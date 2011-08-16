class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  belongs_to :cart
  
  def total_price
    product.price * quantity
  end
  
	def remove_self
		if self.quantity > 1 then 
			self.quantity -= 1
		else 
			self.destroy
		end
	end
end
