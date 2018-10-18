class Game < ApplicationRecord
  belongs_to :user
  belongs_to :quiz
  has_many :guesses
  accepts_nested_attributes_for :guesses, reject_if: :all_blank

  #class methods show top 5 scores of quiz and the top score of the quiz
  scope :top_5_scores, ->(quiz){order(score: :desc).limit(5).where("quiz_id = ?", quiz.id)}
  scope :top_score, ->(quiz){order(score: :desc).limit(1).where("quiz_id = ?", quiz.id)}

  def play_game #compares answers and updates score for game
    game_score = (quiz.correct_answers & user_guesses).count
    self.score = game_score
    self.save
  end

  def user_guesses # turns guesses into an array
    self.guesses.collect{|g| g.guess}
  end



end
