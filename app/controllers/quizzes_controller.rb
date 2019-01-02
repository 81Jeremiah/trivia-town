class QuizzesController < ApplicationController
  before_action :require_login, only:[:index,:new,:top_quizzes, :show]
  before_action  :set_quiz, only:[:show, :edit, :update, :destroy, :quiz_owner]
  before_action :quiz_owner, only:[:edit, :update, :destroy]

  def index
    @quizzes = Quiz.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @quizzes, status: 200}
    end
  end

  def new
  	@quiz = Quiz.new
  end

#shows page top 5 quizzes by times played
  def top_quizzes
    @quizzes = Quiz.most_games
  end

  def show
    # render json: @quiz, status: 200

  end


  def create
  	@quiz = Quiz.new(quiz_params)
    @quiz.user_id = current_user.id
    @quiz.save
    render json: @quiz, status: 201
     # if
     #   @quiz.save
     #   redirect_to quiz_path(@quiz)
     # else
     #   render :new
     # end
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
#finds correct quiz by params
  def set_quiz
    @quiz = Quiz.find_by(id: params[:id])
  end
#verifies quiz owner to allow edit
  def quiz_owner
    if @quiz.user_id != current_user.id
      redirect_to quiz_path(@quiz)
    end
  end

end
