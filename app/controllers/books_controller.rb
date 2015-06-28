class BooksController < ApplicationController
  def show
    @book = Book.includes(:listings).find(params[:id])
    @listings = @book.active_listings
  end
end
