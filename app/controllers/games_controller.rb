class GamesController < ApplicationController

    def new
      @game = Game.new
      @quiz = Quiz.find_by(id: params[:quiz_id])
      @game.user_id = current_user.id
      @game.quiz_id = @quiz.id
      @game.guess = params[:guess]
      @game.save
      message = Game.play_game(@game)
      #game = Game.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
      redirect_to quiz_path(@quiz, message: message)

    end

end
