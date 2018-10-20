class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def index
  end

  def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
     #!!session[:user_id]
     !!current_user
    end

  private

  def require_login
    redirect_to login_path unless logged_in?
  end
end
