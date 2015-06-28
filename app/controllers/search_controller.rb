class SearchController < ApplicationController
  def index
    @books = Book.with_title(params[:name]).limit(50)
    @listings = Listing.joins(:book).with_title(params[:name]).limit(100)
  end
end
