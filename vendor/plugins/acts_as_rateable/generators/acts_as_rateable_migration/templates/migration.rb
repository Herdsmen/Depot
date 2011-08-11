class ActsAsRateableMigration < ActiveRecord::Migration
  def self.up
    create_table "ratings" do |t|
      t.references "rateable",       :polymorphic => true, :nil => false
      t.float      "average_rating"
      t.integer    "ratings_count"
      t.timestamps
    end
    add_index "ratings", ["rateable_id", "rateable_type"]

    create_table "user_ratings" do |t|
      t.references "rating", :nil => false
      t.references "user",   :nil => false
      t.integer    "score",  :nil => false
      t.timestamps
    end
    add_index "user_ratings", ["user_id", "rating_id"]
  end

  def self.down
    drop_table "user_ratings"
    drop_table "ratings"
  end
end
