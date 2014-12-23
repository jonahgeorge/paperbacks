class UsersController < ApplicationController

  # GET /join
  def new
    @user = User.new
  end

  # POST /join
  def create
    @user = User.new(user_params)

    begin
      if @user.save
        session[:user_id] = @user.id
        flash[:success] = "Welcome to Paperbacks!"
        redirect_to root_path
        return
      else
        render 'new'
        return
      end
    rescue
      flash[:error] = "An internal error occured, but don't worry!"
      redirect_to root_path
      return
    end

    redirect_to root_path
    return
  end

  private

  def user_params
    params[:user].permit(:name, :email, :password)
  end

end
