class User < ActiveRecord::Base
  has_secure_password
  
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates :username, :presence => true, :uniqueness => true, :length => {:in => 3..20}
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, length: { minimum: 8 }, allow_nil: true, :on => :create
end
