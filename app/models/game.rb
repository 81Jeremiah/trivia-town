class Game < ApplicationRecord
  belongs_to :user
  belongs_to :quiz
  #accepts_nested_attributes_for :guesses


  def self.play_game(game)
    #binding.pry
    game_score = (quiz.correct_answers & user_guesses).count
    game.score = game_score
    game.save
  end
  
  def self.top_5quiz_scores
    order(score: :desc).limit(5)
  end

  def user_guesses
    self.guesses.collect{|g| g.guess}
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
