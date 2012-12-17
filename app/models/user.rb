class User < ActiveRecord::Base
  attr_accessible :username, :password
  validates :username, presence: true, uniqueness: true
  has_secure_password

  def self.auth_user (username, password)
    user = User.find_by_username(username).try(:authenticate, password)
    if user
      user.token = Digest::SHA256.hexdigest (Array.new(10){rand(1024).to_s(36)}.join + user.username)
      user.save
      return user.token
    else
      nil
    end
  end
end

