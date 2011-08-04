class CreateCustomersProductsWithoutPrimarykey < ActiveRecord::Migration
  def self.up
    create_table :customers_products,:id=>false ,:force => true do |t|
      t.integer :customer_id, :null => false
      t.integer :product_id, :null => false
    end
  end

  def self.down
        drop_table :customers_products
  end
end