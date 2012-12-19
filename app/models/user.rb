class User < ActiveRecord::Base
  attr_accessible :username, :password, :token
  validates :username, presence: true, uniqueness: true
  validates :token, uniqueness: true

  has_many :posts
  has_many :comments
  has_many :votes

  has_secure_password

  def user_recent_action action
    self.action.order "updated_at DESC"
  end




  def self.auth_user (username, password)
    user = User.find_by_username(username).try(:authenticate, password)
    if user
      user.generate_token
      return user.token
    else
      nil
    end
  end

  def generate_token
    begin
      token = SecureRandom.urlsafe_base64
    end while User.where(token: token).exists?

    self.update_attributes token: token
  end
end

