class Game < ApplicationRecord
  belongs_to :user
  belongs_to :quiz

  def self.play_game(game)
    #binding.pry

    if game.guess == game.quiz.answers[0].answer
      game.score += 1
      game.save
      binding.pry
      "congratulaions"
    else "sorry chump"
    end
  end

  def self.top_5quiz_scores
    order(score: :desc).limit(5)
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
