class UserRating < ActiveRecord::Base
  belongs_to :rating

  delegate :max_rating, :to => :rating

  validates_presence_of :score
  validates_uniqueness_of :user_id, :scope => :rating_id
  validate :max_rating_allowed_by_parent

  after_save do |user_rating|
    user_rating.rating.update_rating
  end

  private

  def max_rating_allowed_by_parent
    if score < 1
      errors.add(:score, "must be greater than or equal to 1")
    elsif score > max_rating
      errors.add(:score, "must be less than or equal to #{max_rating}")
    end
  end

end
