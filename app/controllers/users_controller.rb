class UsersController < ApplicationController

  def index
    @user = User.new
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)
    @users = User.all
    if @user.save
      flash[:notice] = "You signed up successfully"
      flash[:color] = "valid"

    else
      flash[:notice] = "Form is invalid"
      flash[:color] = "invalid"

    end

    render "index"
  end

  private 
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
