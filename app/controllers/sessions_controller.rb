class SessionsController < ApplicationController

  # GET /login
  def new
  end

  # POST /login
  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    elsif user
      flash.now.alert = "Invalid password"
      render "new"
    else
      flash.now.alert = "Invalid email"
      render "new"
    end
  end

  # GET /logout
  def destroy
    session[:user_id] = nil

    redirect_to root_url
  end

end
