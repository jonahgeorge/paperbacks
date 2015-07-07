class SearchController < ApplicationController
  def index
    @books = Book.with_title(params[:name]).limit(25)
    @listings = Listing.joins(:book).with_title(params[:name]).limit(10)
  end
end
