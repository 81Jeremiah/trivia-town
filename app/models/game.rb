class Game < ApplicationRecord
  belongs_to :user
  belongs_to :quiz
  #accepts_nested_attributes_for :guesses


  def self.play_game(game)
    #binding.pry
    answers = game.quiz.answers.collect{a.answer}
    answer_guesses = games.guess
    correct_answers = answers & answer_guesses
    game_score = correct_answers.count
    game.score += correct_answers.count
    game score = game.quiz.answers.count do |answer|
      answer = game
    if game.guess == game.quiz.answers[0].answer
      game.score += 1
      game.save
      binding.pry
      "congratulaions"
    else "sorry chump"
    end
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
