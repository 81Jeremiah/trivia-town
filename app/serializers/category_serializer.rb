class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  # has_many :quiz_categories
  # has_many :quizzes, through: :quiz_categories
end
