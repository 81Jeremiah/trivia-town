class QuizzesController < ApplicationController
  def index

    if params[:user_id]
      @quizzes = User.find(pamas[:user_id]).quizzes
    else
    @quizzes = Quiz.all
  end
end
  def new
  	@quiz = Quiz.new
    5.times{@quiz.question_and_answers.build}

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
    params.require(:quiz).permit(:name, question_and_answers_attributes: [:question, :answer])
  end
end
