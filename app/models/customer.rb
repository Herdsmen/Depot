class Customer < User
  has_and_belongs_to_many :products
  has_many :orders ,:dependent => :destroy
  has_one :cart ,:dependent => :destroy
  
    before_destroy :ensure_delete_collection
    
    
  def ensure_delete_collection
    products.delete_all
  end
    
  def add_products_to_collection(product_id)
    product=Product.find_by_id(product_id)
    products<<product unless products.find_by_id(product_id)
  end
  
  def remove_products_from_collection(product_id)
    product=Product.find_by_id(product_id)
    products.delete(product)
  end
end
