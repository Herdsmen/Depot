class Customer < User
  has_and_belongs_to_many :products
  
  def add_products_to_collection(product_id)
    product=Product.find_by_id(product_id)
    products<<product
  end
end
