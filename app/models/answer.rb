class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :votes, as: :votable

  def points
    votes.where(upvote: true).count - votes.where(upvote: false).count
  end
end
