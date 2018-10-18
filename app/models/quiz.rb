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
	
  scope :most_games, -> {joins(:games).group(:id).order("COUNT(games.id) DESC").limit(5)}
  scope :by_category, -> (category_id){joins(:categories).where("categories.id=?", category_id)}

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


end
