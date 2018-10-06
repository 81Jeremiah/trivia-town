class GamesController < ApplicationController

    def new
      @game = Game.new(quiz_id: params[:quiz_id])
      @quiz = Quiz.find_by(id: params[:quiz_id])
      #@quiz = Quiz.find_by(id: params[:quiz_id])
      @game.guesses.build
      #binding.pry
      #@game.update(user_id: current_user.id, quiz_id: @quiz.id, guess: params[][:guess])
      # @game.user_id = current_user.id
      # #@game.quiz_id = @quiz.id
      # #binding.pry
      # @game.guesses = params[:guess]
      # @game.save
      # message = Game.play_game(@game)
      # #game = Game.create(user_id: params[:user_id], attraction_id: params[:attraction_id])
      # redirect_to quiz_path(@quiz, message: message)

    end

    def create
    #  binding.pry

      @game = Game.new(game_params)
      @game.user_id = current_user.id
      @game.save
      @game.play_game
      redirect_to @game
      #binding.pry
    end

    def show
      @game = Game.find_by(id: params[:id])
    end

#    private
#
#    def game_params
#
#
#
# end
#
#
# def create
#   quiz = Quiz.create(quiz_params)
#
#     redirect_to quiz_path(quiz)
#
# end
#
# private
def game_params
  params.require(:game).permit(:quiz_id, guesses_attributes: [:guess])
end
end
