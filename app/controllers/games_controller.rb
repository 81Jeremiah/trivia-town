class GamesController < ApplicationController

    def new
      @game = Game.new
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
      #game = Game.create
    end
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
#
# def quiz_params
#   params.require(:game).permit(:name, question_and_answers_attributes: [:question, :answer])
# end
