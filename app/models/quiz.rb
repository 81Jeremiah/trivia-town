class Quiz < ApplicationRecord
	# has_many :questions
	# has_many :answers   #, through: :questions
	# has_many :games
	# accepts_nested_attributes_for :answers
	# accepts_nested_attributes_for :questions
  has_many :question_and_answers
  accepts_nested_attributes_for :question_and_answers, reject_if: :all_blank
  #has_many :quiz_categories
  has_many :categories, through: :quiz_categories
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments
  has_many :users, through: :games
	def self.by_category(category_id)
		joins(:categories).where("categories.id=?", category_id)
	end
	# def question=(question)
  #   self.question = Question.create(question: question)
  # end
	#
	# def answer=(answer)
	#   self.answer = Answer.create(answer: answer)
	# end

	def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.categories << category
    end
  end

  def correct_answers
  	self.question_and_answers.collect{|qa| qa.answer}
  end

def self.top_5_scores(quiz)
	  joins(:games).where quiz_id = "?", quiz.id
end


end
