class Submission < ActiveRecord::Base
	belongs_to :responder, class_name: "User"
	belongs_to :survey
	has_many :responses
	# has_many :choices, through: :responses
	# has_many :questions, through: :choices
end
