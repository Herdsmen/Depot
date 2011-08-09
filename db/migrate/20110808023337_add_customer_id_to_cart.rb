class AddCustomerIdToCart < ActiveRecord::Migration
  def self.up
    add_column :carts, :customer_id, :integer
  end

  def self.down
    remove_column :carts, :customer_id
  end
end
