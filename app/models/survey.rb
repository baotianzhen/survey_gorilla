class Survey < ActiveRecord::Base
	belongs_to :author, class_name: "User"
	has_many :questions
	has_many :submissions
end
