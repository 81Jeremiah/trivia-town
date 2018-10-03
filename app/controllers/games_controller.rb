class GamesController < ApplicationController

    def new
      @game = Game.new
      @quiz = Quiz.find_by(id: params[:quiz_id])
      #binding.pry
      @game.update(user_id:current_user.id, quiz_id: @quiz.id, guess: params[][:guess])
      # @game.user_id = current_user.id
      # @game.quiz_id = @quiz.id
      # @game.guess = params[:guess]
      # @game.save
      message = Game.play_game(@game)
      #game = Game.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
      redirect_to quiz_path(@quiz, message: message)

    end

end
