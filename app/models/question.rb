class Question < ActiveRecord::Base
  has_many :answers
  has_many :votes, as: :votable

  def points
    votes.where(upvote: true).count - votes.where(upvote: false).count
  end
end
