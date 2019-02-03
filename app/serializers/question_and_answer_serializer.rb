class QuestionAndAnswerSerializer < ActiveModel::Serializer
  attributes :question,:answer, :id, :quiz_id
  # belongs_to :quiz, serializer: QuizQuestionAndAnswerSerializer


end
