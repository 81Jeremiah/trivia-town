class QuizzesController < ApplicationController
  before_action :require_login
  before_action  :set_quiz, only:[:show, :edit, :update]

  def index
    @categories = Category.all

    if !params[:category].blank?
      @quizzes = Quiz.by_category(params[:category])
    else
      @quizzes = Quiz.all
    end
  end

  def new
  	@quiz = Quiz.new
    #5.times{@quiz.question_and_answers.build}

  end

  def show
    @quiz = Quiz.find_by(id: params[:id])
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
    redirect_to @quiz
  end


  private

  def quiz_params
    params.require(:quiz).permit(:name, category_ids:[], categories_attributes: [:name], question_and_answers_attributes: [:question, :answer])
  end

  def set_quiz
    @quiz = Quiz.find_by(id: params[:id])
  end
end
