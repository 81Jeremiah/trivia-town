class Category < ApplicationRecord
  has_many :quiz_categories
  has_many :quizzes, through: :quiz_categories
end
