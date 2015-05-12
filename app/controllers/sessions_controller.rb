class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])

    if @user && @user.authenticate(params[:password]) && @user.confirmed?
      session[:user_id] = @user.id
      flash[:success] = "Logged in!"
      redirect_to root_path
    elsif @user && @user.authenticate(params[:password])
      redirect_to confirm_path
    else
      flash.now[:danger] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You've been logged out"
    redirect_to root_path
  end
end
