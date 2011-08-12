require File.expand_path(File.join(File.dirname(__FILE__), '../test_helper'))

class ActsAsRateableTest < ActiveSupport::TestCase

  test "rate_it one user" do
    books(:alice).rate_it("4", users(:john))
    assert_equal 1, books(:alice).ratings_count
    assert_equal 4.0, books(:alice).average_rating
    assert_equal 4, books(:alice).rating_by(users(:john))
    assert_equal true, books(:alice).rated_by?(users(:john))
    assert_equal false, books(:alice).rated_by?(users(:jane))
  end

  test "rate_it multiple users" do
    books(:alice).rate_it(4, users(:jane))
    books(:alice).rate_it("5", users(:bill))
    assert_equal 2, books(:alice).ratings_count
    assert_equal 4.5, books(:alice).average_rating
    assert_equal 4, books(:alice).rating_by(users(:jane))
    assert_equal 5, books(:alice).rating_by(users(:bill))
    assert_equal false, books(:alice).rated_by?(users(:john))
    assert_equal true, books(:alice).rated_by?(users(:jane))
    assert_equal true, books(:alice).rated_by?(users(:bill))
  end

  test "rate_it same user multiple times" do
    books(:alice).rate_it(5, users(:jane))
    books(:alice).rate_it(5, users(:bill))
    assert_equal 2, books(:alice).ratings_count
    assert_equal 5.0, books(:alice).average_rating
    books(:alice).rate_it(1, users(:bill))
    assert_equal 2, books(:alice).ratings_count
    assert_equal 3.0, books(:alice).average_rating
  end

  test "Rateable.find_top_rated" do
    books(:lotr).rate_it(5, users(:bill))
    books(:alice).rate_it(4, users(:jane))
    assert_equal [books(:lotr), books(:alice)], Book.find_top_rated
    assert_equal [books(:lotr), books(:alice)], Book.find_top_rated(:order => "books.title ASC")
    assert_equal [books(:lotr)], Book.find_top_rated(:limit => 1)
  end

  test "rated_by and rating_by when no rating should not break" do
    books(:lotr).rate_it(5, users(:bill))
    assert_equal false, books(:lotr).rated_by?(users(:jack))
    assert_equal nil, books(:lotr).rating_by(users(:jack))
  end

end
