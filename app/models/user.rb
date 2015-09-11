require 'bcrypt'
class User < ActiveRecord::Base

  validates :username, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def correct_password?(pwd)
    self.password == pwd
  end
end
