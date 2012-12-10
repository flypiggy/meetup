class Post < ActiveRecord::Base
  attr_accessible :title, :url

  has_many :comments
  validates :title, presence: true
  validates :url, presence: true
end
