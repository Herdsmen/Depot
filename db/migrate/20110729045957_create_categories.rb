class CreateCategories < ActiveRecord::Migration
	def self.up
		create_table :categories do | t |
			t.string :name
			t.integer :parent, :default => 1
			t.integer :layer, :default => 1

			t.timestamps
		end

		Category.create :name => "ROOT_NODE",
						:parent => -1,
						:layer => 0
	end

	def self.down
		drop_table :categories
	end
end
