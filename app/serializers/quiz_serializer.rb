class QuizSerializer < ActiveModel::Serializer
  attributes :id, :name, :quiz_score_id, :user_id
  has_many :games
  has_many :question_and_answers
  has_many :quiz_categories
  has_many :categories, through: :quiz_categories
  has_many :comments
  has_many :users, through: :comments
  has_many :users, through: :games
end
