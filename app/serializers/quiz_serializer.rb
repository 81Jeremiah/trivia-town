class QuizSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id
  belongs_to :user
  has_many :games, serializer: QuizGameSerializer
  has_many :question_and_answers
  # has_many :quiz_categories
  has_many :categories, through: :quiz_categories
end
