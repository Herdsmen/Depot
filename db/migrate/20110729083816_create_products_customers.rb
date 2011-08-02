class CreateProductsCustomers < ActiveRecord::Migration
  def self.up
    create_table :products_customers do |t|
      t.integer :product_id
      t.integer :customer_id
    end
  end

  def self.down
        drop_table :products_customers
  end
end
