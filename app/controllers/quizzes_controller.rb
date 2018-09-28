class QuizzesController < ApplicationController
  def index
  	@quizzes = Quiz.all
  end

  def new
  	@quiz = Quiz.new
  end

  def create
  	quiz = Quiz.new(quiz_params)
    if quiz.save
 
      redirect_to quizzes_path
    else
      render :new
    end
  end




  private

  def quiz_params
    params.require(:user).permit(:questions, :answers)
  end
end