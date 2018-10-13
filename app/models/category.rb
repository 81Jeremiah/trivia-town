class Category < ApplicationRecord
  has_many :quiz_categories
  has_many :quizzes, through: :quiz_categories
  validates :name, presence: true

  def to_param
    name
  end
end
