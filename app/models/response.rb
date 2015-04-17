class Response < ActiveRecord::Base
	belongs_to :submission
	belongs_to :choice
end
