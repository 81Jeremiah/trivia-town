class Quiz < ApplicationRecord
	# has_many :questions
	# has_many :answers   #, through: :questions
	has_many :games
	# accepts_nested_attributes_for :answers
	# accepts_nested_attributes_for :questions
  has_many :question_and_answers
  accepts_nested_attributes_for :question_and_answers, reject_if: :all_blank
  has_many :quiz_categories
  validates :name, presence: true

  has_many :categories, through: :quiz_categories
  validates :categories, presence: true
  validate :must_have_question_and_answer
  #validate :must_have_one_category
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments
  has_many :users, through: :games
  #before_save :erase_empty_category
  scope :most_games, ->{joins(:games).group(:id).order("COUNT(games.id) DESC").limit(5)}



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

      if category_attribute[:name] != ""
        category = Category.find_or_create_by(category_attribute)
        self.categories << category
      else
        return errors
      end
    end
  end

  def correct_answers
  	self.question_and_answers.collect{|qa| qa.answer}
  end

def self.top_5_scores(quiz)
	  joins(:games).where quiz_id = "?", quiz.id
end

private

  def must_have_question_and_answer
    return errors.add :base, "Must Have 5 Questions and Answers" unless question_and_answers.length == 5
  end

  # def erase_empty_category
  #    self.categories = self.categories.select {|i| i.name && i.name != ''}
  #  end
  # def must_have_one_category
  #   return errors.add :base, "Must Have 5 Questions and Answers" unless quiz_categories.length > 0 && quiz_categories != ""
  # end
end
