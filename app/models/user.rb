class User < ApplicationRecord
	has_secure_password
	has_many :games
	has_many :quiz_scores

	validates :username, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  validates :email, uniqueness: true

	
end
