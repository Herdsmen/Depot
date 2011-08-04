class Product < ActiveRecord::Base
	default_scope :order => 'title'
	has_many :line_items
	has_many :orders, :through => :line_items
	has_and_belongs_to_many :customers
  
	has_and_belongs_to_many :categories
	validates :categories, :presence => true
  
	before_destroy :ensure_not_referenced_by_any_line_item

	def ensure_not_referenced_by_any_line_item
		if line_items.count.zero?
			return true
		else
			errors[:base] << "Line Items present"
			return false
		end
	end
  
	validates :title, :description, :image_url, :presence => true
	validates :price, :numericality => {:greater_than_or_equal_to => 0.01}

	validates :title, :uniqueness => true
	validates :image_url, :format => {
		:with    => %r{\.(gif|jpg|png)$}i,
		:message => 'must be a URL for GIF, JPG or PNG image.'
	}
	
	class << self
		#
		# 
		#
		def getProductsByCategoryID(categoryID)
			category_ids = Category.getAllNodeIdUnderNode categoryID
			product_ids = Array.new 
			
			category_ids.each do | categoryID |
			   product_ids = product_ids | Category.find(categoryID).product_ids
			end
			
			Product.find product_ids
		end
		
		def get_top_five
			Product.all.sort_by{|p| p.heat}.reverse.first(5)
		end
	end
	
	#
	# Get a product's categories
	# @return 
	#
	def getCategories
		@category_ids = Product.find(id).category_ids;
		
		return Category.find(@category_ids);
	end
end
