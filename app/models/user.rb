class User < ActiveRecord::Base
	attr_reader :form_password
	has_many :submissions
	has_many :surveys, foreign_key: :author_id

	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true, format: {with: /[\w\d.]+@[\w\d]+.[\w\d]+/, message: "must be a valid email address"}
	validates :form_password, presence: true, format: {with: /[\w\d]{6,}/}

	include BCrypt




	def password=(pass)
		@form_password = pass
		@password = Password.create(pass)
		self.password_hash = @password
	end

	def password
		@password ||= Password.new(password_hash)
	end

	def self.authenticate(username, password)
		user = User.find_by_username(username)
		return user if user && (user.password == password)
		nil
	end


end
