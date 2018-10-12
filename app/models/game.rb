class Game < ApplicationRecord
  belongs_to :user
  belongs_to :quiz
  has_many :guesses
  accepts_nested_attributes_for :guesses, reject_if: :all_blank


  def play_game
    #binding.pry
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
  # def play_game
  #    user.answer_array.each do |answer|
  #      if answer == quiz_anwer
  #        user_game_score + 1
  #      end
  #      user.game_score.save
  #    end
  # end

end
  #user.quiz.question.answer = user.quiz.question.guess
