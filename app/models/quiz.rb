class Quiz < ApplicationRecord
	has_many :questions
	has_many :answers   #, through: :questions
	accepts_nested_attributes_for :answers
	accepts_nested_attributes_for :questions


	# def question=(question)
  #   self.question = Question.create(question: question)
  # end
	#
	# def answer=(answer)
	#   self.answer = Answer.create(answer: answer)
	# end
end
