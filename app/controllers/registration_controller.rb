class RegistrationController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to register_path
    end
  end

  private

  def user_params
    if params[:user][:admin] == "0"
      params[:user][:admin] == false
    else
      params[:user][:admin] == true
    end

    params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :password, :admin)
  end
end