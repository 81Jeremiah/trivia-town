class Quiz < ApplicationRecord
	# has_many :questions
	# has_many :answers   #, through: :questions
	# has_many :games
	# accepts_nested_attributes_for :answers
	# accepts_nested_attributes_for :questions
  has_many :question_and_answers
	accepts_nested_attributes_for :question_and_answers

	# def question=(question)
  #   self.question = Question.create(question: question)
  # end
	#
	# def answer=(answer)
	#   self.answer = Answer.create(answer: answer)
	# end

  def correct_answers
  	self.question_and_answers.collect{|qa| qa.answer}
  end

  
end
