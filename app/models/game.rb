class Game < ApplicationRecord
  belongs_to :user
  belongs_to :quiz
  has_many :guesses
  accepts_nested_attributes_for :guesses, reject_if: :all_blank

  scope :top_5_scores(quiz), ->{jorder(score: :desc).limit(5).where("quiz_id = ?", quiz.id)}


  def play_game
    game_score = (quiz.correct_answers & user_guesses).count
    self.score = game_score
    self.save
  end


  def self.top_5_scores(quiz)
  	  order(score: :desc).limit(5).where("quiz_id = ?", quiz.id)
  end

  def user_guesses
    self.guesses.collect{|g| g.guess}
  end

   def self.user_scores(user)
     where("user_id = ?", user.id)
   end

   def self.top_score(quiz)
      order(score: :desc).limit(1).where("quiz_id = ?", quiz.id)
   end


end
