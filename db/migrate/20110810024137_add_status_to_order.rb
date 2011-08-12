class AddStatusToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :status, :boolean ,:default =>false
  end

  def self.down
    remove_column :orders, :status
  end
end
