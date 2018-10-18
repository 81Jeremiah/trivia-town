class GamesController < ApplicationController
  before_action :require_login

#load game form and build empty guess fields
  def new
    @game = Game.new(quiz_id: params[:quiz_id])
    @quiz = Quiz.find_by(id: params[:quiz_id])
    @game.guesses.build
  end

#game play- compares answers and returns sore on game show page
  def create
    @game = Game.new(game_params)
    @game.user_id = current_user.id
    @game.save
    @game.play_game
    redirect_to quiz_game_path(@game.quiz, @game)
  end

  def show
    @game = Game.find_by(id: params[:id])
  end

 private
  def game_params
    params.require(:game).permit(:quiz_id, guesses_attributes: [:guess])
  end
end
