class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  belongs_to :customer
  
  def add_product(product_id, quantity)
    current_item = line_items.where(:product_id => product_id).first
    if current_item
      current_item.quantity += quantity.to_f
    else
      current_item = LineItem.new(:product_id => product_id, :quantity => quantity.to_f)
      line_items << current_item
    end
    product = Product.find(product_id)
    product.heat += quantity.to_f
    product.save
    current_item
  end
  
  def total_price
    line_items.to_a.sum{|item| item.total_price }
  end
  
  def total_items
    line_items.sum(:quantity)
  end
  
  def add_to_line_items(item)
    line_item=line_items.find_by_product_id(item.product_id)
    if line_item
      line_item.quantity+=item.quantity
      line_item.save
    else
      line_items<<item
    end
  end
  
  
  
end
