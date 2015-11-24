class User < ActiveRecord::Base
	has_and_belongs_to_many :locations
	has_many :favorites

	validates :email,
	presence: true,
	uniqueness: {case_sensitive: false},
	email: true

	validates :password,
	presence: true,
	length: {
		minimum: 8,
		maximum: 99,
		too_short: "must be greater than %{count} characters",
		too_long: "must be less than %{count} characters"
	},
	confirmation: true

	validates :name,
	presence: true,
	length: { maximum: 20, too_long: "%{count} characters is the maximum allowed"}

	has_secure_password

	def self.authenticate email, password
		User.find_by_email(email).try(:authenticate, password)
	end
end
