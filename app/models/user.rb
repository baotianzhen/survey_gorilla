class User < ActiveRecord::Base
	has_many :submissions
	has_many :surveys, foreign_key: :author_id
end
