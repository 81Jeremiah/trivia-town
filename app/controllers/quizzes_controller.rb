class QuizzesController < ApplicationController
  def index
  	@quizzes = Quiz.all
  end

  def new
  	@quiz = Quiz.new
    @quiz.questions.build
    @quiz.answers.build

  end

  def show
    @quiz = Quiz.find_by(id: params[:id])
    @game = Game.new
  end


  def create
  	quiz = Quiz.create(quiz_params)

      redirect_to quiz_path(quiz)

  end

  private

  def quiz_params
    params.require(:quiz).permit(:name , questions_attributes: [:question], answers_attributes: [:answer])
  end
end
