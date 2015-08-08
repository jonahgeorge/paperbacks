class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @listings = @user.listings.active
  end
end
