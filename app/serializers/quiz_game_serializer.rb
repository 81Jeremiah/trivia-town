class QuizGameSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :quiz_id, :score

end
