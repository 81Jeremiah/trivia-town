class User < ApplicationRecord
	has_secure_password
	has_many :games
	has_many :quiz_scores
  has_many :comments
	has_many :quizzes, through: :comments
	validates :username, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
  validates :email, uniqueness: true
  has_many :quizzes, through: :games
  has_many :quizzes
	
end
