class UsersController < ApplicationController
  before_action :require_login , only:[:show]

  def new
    @user = User.new
  end

  def index

  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end

  end

  def quizzes_user_created
    render '/users/quizzes_user_created', layout: false
  end

  def games_users_played
    render '/users/games_users_played', layout: false
  end


private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
