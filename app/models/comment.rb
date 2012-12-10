class Comment < ActiveRecord::Base
  attr_accessible :content, :post_id

  belongs_to :post
  validates :content, presence: true
end
