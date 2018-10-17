class QuizzesController < ApplicationController
  before_action :require_login, only:[:index,:new,:top_quizzes, :show]
  before_action  :set_quiz, only:[:show, :edit, :update, :destroy, :quiz_owner]
  before_action :quiz_owner, only:[:edit, :update, :destroy]

  def index
    @quizzes = Quiz.all
  end

  def new
  	@quiz = Quiz.new
  end

  def top_quizzes
    @top5played = Quiz.most_games
    #@top5creators =
  end

  def show

  end


  def create
  	@quiz = Quiz.new(quiz_params)
    @quiz.user_id = current_user.id
    if
    @quiz.save
      redirect_to quiz_path(@quiz)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @quiz.update(quiz_params)
    flash[:message]="Quiz updated!"
    redirect_to @quiz
  end

  def destroy
    @quiz.destroy
    flash[:message]="Quiz deleted!"
    redirect_to user_path(User.find(session[:user_id]))
  end



  private

  def quiz_params
    params.require(:quiz).permit(:name, category_ids:[], categories_attributes: [:name], question_and_answers_attributes: [:question, :answer, :id])
  end

  def set_quiz
    @quiz = Quiz.find_by(id: params[:id])
  end

  def quiz_owner
    if @quiz.user_id != current_user.id
      redirect_to quiz_path(@quiz)
    end
  end

end
