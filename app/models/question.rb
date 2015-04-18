class Question < ActiveRecord::Base
  validates :prompt, presence: true, format: {with: /banana/, message: "Your question must be about bananas"}

	belongs_to :survey
	has_many :choices
	has_many :responses, through: :choices

end
