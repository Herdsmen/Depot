class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true

  default_scope :order => 'created_at ASC'

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :user
  
  validates :title, :comment, :user_id, :presence => true
  class << self
    def get_users(comments)
      users = Array.new
      comments.each do |comment|
        user = User.find(comment.user_id)
        users[comment.user_id] = user.name
      end
      users
    end
  end
end
