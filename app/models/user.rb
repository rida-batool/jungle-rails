class User < ApplicationRecord
  has_secure_password

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 7 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    email = email.strip
    user = User.where('LOWER(email) = ?', email.downcase).first
  #  user = User.find_by_email(email)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
end
