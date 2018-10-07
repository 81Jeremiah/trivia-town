class SessionsController < ApplicationController
  def new
  end

  def create
    if auth_hash
      @user = User.find_or_create_by(uid: auth_hash['uid']) do |u|
        u.username = auth_hash['info']['name']
        u.email = auth_hash['info']['email']
        u.image = auth_hash['info']['image']
        u.password = SecureRandom.hex
      end
    session[:user_id] = @user.id
    redirect_to @user
  else
    @user = User.find_by(username: params[:user][:username])

     if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
      else
       render :new
    end
  end
end
  def destroy
    session.destroy
    redirect_to root_path
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
  private
  def auth_hash
    request.env['omniauth.auth']
  end
end
