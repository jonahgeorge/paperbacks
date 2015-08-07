class ListingsController < ApplicationController
  def index
    @listings = Listing.where_title_like(params[:q])
  end

  def new
    @books = Book.where(nil)
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id

    if @listing.save
      redirect_to listings_path
    else
      render "new"
    end
  end

  # def show
  # end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  private

  def listing_params
    params[:listing].permit(:book_id, :user_id, :price)
  end
end
