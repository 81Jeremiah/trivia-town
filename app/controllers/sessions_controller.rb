class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

end
  #onmiauth stuff
  # def create
  #   @user = User.find_or_create_by(uid: auth['uid']) do |u|
  #    u.name = auth['info']['name']
  #    u.email = auth['info']['email']
  #    u.image = auth['info']['image']
  #  end
  #  session[:user_id] = @user.id
  #  render 'welcome/home'

  # end

  # def auth
  #   request.env['omniauth.auth']
  # end