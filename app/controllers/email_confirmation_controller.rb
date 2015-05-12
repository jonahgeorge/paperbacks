class EmailConfirmationController < ApplicationController
  def show
    if params[:token].present?
      @user = User.find_by_token(params[:token])
      if @user
        @user.confirmed = true
        @user.token = nil
        @user.save

        session[:user_id] = @user.id
        flash[:success] = "Welcome to Paperbacks!"
        redirect_to root_path
      else
        flash.now[:danger] = "That token is invalid"
        render "show"
      end
    end
  end
end
