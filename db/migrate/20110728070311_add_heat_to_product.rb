class AddHeatToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :heat, :integer
  end

  def self.down
    remove_column :products, :heat
  end
end
