class CreateCategoriesProductsJoinTable < ActiveRecord::Migration
	def self.up
		create_table :categories_products, :id => false do | t |
			t.integer :product_id
			t.integer :category_id
			
			t.timestamps
		end
		
		add_index :categories_products, [:product_id, :category_id]
	end

	def self.down
		remove_index :categories_products, :column => [:product_id, :category_id]
		drop_table :categories_products
	end
end
