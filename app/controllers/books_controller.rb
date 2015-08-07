class BooksController < ApplicationController
  def index
    @books = Book.where(nil)
    @books = @books.where_title_like(params[:q]) if params[:q].present?
  end

  def show
    @book = Book.find(params[:id])
    @listings = @book.active_listings
  end
end
