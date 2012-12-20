class Node < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :posts
end
