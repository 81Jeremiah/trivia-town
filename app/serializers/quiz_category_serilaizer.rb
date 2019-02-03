class QuizCategorySerializer < ActiveModel::Serializer
  attributes :id, :quiz_id, :category_id
end
