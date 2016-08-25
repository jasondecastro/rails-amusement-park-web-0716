class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :edit, :destroy]
  before_action :require_login
  skip_before_action :require_login, only: [:index, :signin, :new, :create]

  def index
  end

  def show
  end

  def new
  end

  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def edit
  end

  def signin
  end

  def auth
    @user = authenticate
    if @user
      redirect_to user_path(@user)
    else
      render :signin
    end
  end

  def signout
    session[:user_id] = ''
  end

  private

  def authenticate
    @user = User.find_by(name: params[:user][:name], password: params[:user][:password])
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password)
  end

  def require_login
    head(:forbidden) unless session.include? :user_id
  end
end