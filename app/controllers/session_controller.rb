class SessionController < ApplicationController
  def new
  end

  def create 
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to '/timetable'
    else
      @message = 'Invalid id or password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end