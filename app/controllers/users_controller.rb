class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :update, :edit, :destroy]
  before_action :authenticate, only: [:show]

  # skip_before_action :require_login, only: [:index, :signin, :new, :create]

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    
  end

  def edit
  end
end