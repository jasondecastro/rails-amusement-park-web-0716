class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :admin?

  def index
    # home page
    render :'/index.html.erb'
  end

  def admin?
    User.find(session[:user_id]).admin
  end

  def current_user
    # return the user who is logged in
    User.find(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def authenticate
    redirect_to root_path unless logged_in?
    # if session[:user_id]
    #   xomething
    # else
    #   redirect_to root_path
    # @user = User.find_by(name: params[:user][:name], password: params[:user][:password])
  end

  # def require_login
  #   head(:forbidden) unless session.include? :user_id
  # end
end
