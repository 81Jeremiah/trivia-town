class QuestionAndAnswerSerializer < ActiveModel::Serializer
  attributes :question,:answer, :id, :quiz_id


end
