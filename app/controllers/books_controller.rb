class BooksController < ApplicationController
  def index
    @books = Book.where(nil)
    @books = @books.by_title(params[:q]) if params[:q].present?
  end

  def show
    @book = Book.find(params[:id])
    @listings = @book.listings.active
  end
end
