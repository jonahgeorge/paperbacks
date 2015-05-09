class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in!"
      redirect_to root_url
    elsif user
      flash.now[:alert] = "Invalid password"
      render "new"
    else
      flash.now[:alert] = "Invalid email"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You've been logged out"
    redirect_to root_url
  end
end
