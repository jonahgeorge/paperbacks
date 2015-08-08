class ListingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @listings = Listing.by_title(params[:q]).active
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    @listing.active = true

    if @listing.save
      redirect_to listings_path
    else
      render "new"
    end
  end

  private

  def listing_params
    params[:listing].permit(:book_id, :user_id, :price)
  end
end
