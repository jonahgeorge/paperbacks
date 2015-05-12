class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.welcome_email(@user).deliver_later
      redirect_to confirm_path
    else
      render "new"
    end
  end

  private

  def user_params
    params[:user].permit(:name, :email, :password, :terms_of_service)
  end
end
