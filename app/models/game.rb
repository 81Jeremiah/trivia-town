class Game < ApplicationRecord

  def play_game
     user.answer_array.each do |answer|
       if answer == quiz_anwer
         user_game_score + 1
       end
       user.game_score.save
     end
  end


end
  #user.quiz.question.answer = user.quiz.question.guess
