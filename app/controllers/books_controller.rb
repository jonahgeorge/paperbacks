class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @listings = @book.active_listings
  end
end
