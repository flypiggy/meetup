class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  has_secure_password


  def create_user(user_name, pass_word)
    self.username = user_name
    self.password = pass_word
    return
  end

end
