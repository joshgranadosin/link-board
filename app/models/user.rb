class User < ActiveRecord::Base
	validates :email,
	presence: true,												#must exist
	uniqueness: {case_sensitive: false},	#option added
	email: true													#got from email_validator gem

	validates :password,
	presence: true,
	on: :create

	validates :name,
	presence: true,
	length: {maximum: 20}

	has_secure_password

	has_many :post

	def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end
end
