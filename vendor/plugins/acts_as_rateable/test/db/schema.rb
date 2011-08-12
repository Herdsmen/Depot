ActiveRecord::Schema.define(:version => 0) do

  create_table "users", :force => true do |t|
    t.text "name"
  end

  create_table "ratings", :force => true do |t|
    t.integer  "rateable_id", :nil => false
    t.string   "rateable_type", :nil => false
    t.float    "average_rating"
    t.integer  "ratings_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_ratings", :force => true do |t|
    t.integer  "rating_id", :nil => false
    t.integer  "user_id", :nil => false
    t.integer  "score", :nil => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", :force => true do |t|
    t.text "title"
  end

  create_table "videos", :force => true do |t|
    t.text "title"
  end
  
end
