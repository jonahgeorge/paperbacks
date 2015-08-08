class SearchController < ApplicationController
  def index
    @books = Book.by_title(params[:q]).limit(10)
    @listings = Listing.by_title(params[:q]).active.limit(10)
  end
end
