class CreateCustomersProducts < ActiveRecord::Migration
  def self.up
    create_table :customers_products do |t|
      t.integer :customer_id
      t.integer :product_id
    end
  end

  def self.down
        drop_table :customers_products
  end
end
