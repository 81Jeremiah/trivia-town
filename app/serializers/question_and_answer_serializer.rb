class QuestionAndAnswerSerializer < ActiveModel::Serializer
  attributes :question,:answer, :id
  belongs_to :quiz, serializer: QuizQuestionAndAnswerSerializer


end
