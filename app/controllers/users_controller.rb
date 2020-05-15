class UsersController < ApplicationController
  def new 
    @user = User.new
    @message = ""
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to '/timetable'
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
