class SearchController < ApplicationController
  def index
    @books = Book.where_title_like(params[:q]).limit(25)
    @listings = Listing.where_title_like(params[:q]).limit(10)
  end
end
