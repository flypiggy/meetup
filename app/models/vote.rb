class Vote < ActiveRecord::Base
  attr_accessible :vote_action

  belongs_to :user
end
