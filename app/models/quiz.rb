class Quiz < ApplicationRecord
  belongs_to :user

	has_many :games
  has_many :question_and_answers
  accepts_nested_attributes_for :question_and_answers, reject_if: :all_blank
	validate :must_have_question_and_answer

  has_many :quiz_categories

	validates :name, presence: true

  has_many :categories, through: :quiz_categories
  validates :categories, presence: true

  has_many :comments
  has_many :users, through: :comments
  has_many :users, through: :games

	#class method to see what quizzes have been played the most
  scope :most_games, -> {joins(:games).group(:id).order("COUNT(games.id) DESC").limit(5)}
  #class method to filter by category given in the argument
	scope :by_category, -> (category_id){joins(:categories).where("categories.id=?", category_id)}
  #class mehod to show top 5 scores per game
	scope :top_5_scores, -> (quiz){joins(:games).where quiz_id = "?", quiz.id}
  #custom category attribute writer - doesn't duplicate and doesn't save blank
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

#creates an array of answers from quiz to compare to array of guesses
  def correct_answers
  	self.question_and_answers.collect{|qa| qa.answer}
  end


private
  #custom validator for 5 questions and answers when creating quiz 
  def must_have_question_and_answer
    return errors.add :base, "Must Have 5 Questions and Answers" unless question_and_answers.length == 5
  end


end
