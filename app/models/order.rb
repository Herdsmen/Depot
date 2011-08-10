class Order < ActiveRecord::Base
	has_many :line_items, :dependent => :destroy
	belongs_to :customer

	PAYMENT_TYPES = ["Check", "Credit card", "Purchase order"]

	validates :name, :address, :email, :pay_type, :presence => true
	validates :pay_type, :inclusion => PAYMENT_TYPES
	
	def add_line_items_from_cart(cart)
		cart.line_items.each do | item |
			item.cart_id = nil
			line_items << item
		end
	end 
	
	def show_status
	  if status
	    return "Shipped"
	  else
	    return "Wait To Be Shipped"
	  end
	end
	
	def ship
	  self.status=true
	end
	
	def total_price
    line_items.to_a.sum{|item| item.total_price }
  end
	
	
end
