class User < ApplicationRecord
  has_secure_password
  before_create { generate_token(:auth_token) }

  #持久化登录
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  validates :name, :email, presence: true
  validates :name, :email, uniqueness: {case_sensitive: false}


end
