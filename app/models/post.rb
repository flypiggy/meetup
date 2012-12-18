class Post < ActiveRecord::Base
  attr_accessible :title, :url

  has_many :comments
  has_many :votes
  belongs_to :user

  validates :title, :url, presence: true

  def vote_count
    votes.where(vote_action: "voteup").count - votes.where(vote_action: "votedown").count
  end

end
