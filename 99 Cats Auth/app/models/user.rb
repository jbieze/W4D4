# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :user_name, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def self.find_by_credentials(username, password)
    user = User.find_by(user_name: username)
    return user if user & user.is_password?(password)
    nil
  end

  def self.reset_session_token!
    session_token = SecureRandom::urlsafe_base64(16)
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  # def user_params
  #   params.require(:user).permit(:user_name, :password)
  # end

end
