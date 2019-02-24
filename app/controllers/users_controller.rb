class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def index
    @user = User.new
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create

    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:notice] = "You signed up successfully"
      flash[:color] = "valid"
      redirect_to @user
    else
      flash[:notice] = "Form is invalid"
      flash[:color] = "invalid"
      render 'new'
    end


  end

  private 
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
