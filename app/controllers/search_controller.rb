class SearchController < ApplicationController
  def index
    @books = Book.where_title_like(params[:name]).limit(25)
    @listings = Listing.where_title_like(params[:name]).limit(10)
  end
end
