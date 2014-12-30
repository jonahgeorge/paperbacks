class ListingsController < ApplicationController
  # GET /listings
  def index
    unless params[:search].blank?
      @books = Book.with_title(params[:search])
    else
      @books = Book.with_title("")
    end
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
