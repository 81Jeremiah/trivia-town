class SessionsController < ApplicationController
  def new
  end

  def create
    if auth_hash
      @user = facebook_login
      session[:user_id] = @user.id
      redirect_to @user
    else
      @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to @user
        else
          flash[:message]="Incorrect email or password. Please try again."
          render :new
        end
     end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end

  def facebook_login
      User.find_or_create_by(uid: auth_hash['uid']) do |u|
      u.username = auth_hash['info']['name']
      u.email = auth_hash['info']['email']
      u.image = auth_hash['info']['image']
      u.password = SecureRandom.hex
    end
  end
end
