class CreateListingController < ApplicationController
  include Wicked::Wizard

  steps :add_book, :add_details

  def show
    case step
    when :add_book
      @books = Book.where(nil)
      @books = @books.where_title_like(params[:title]) if params[:title].present?
    when :add_details
    end
    render_wizard
  end

  def update
    @listing = Listing.new
    case step
    when :add_book
      @listing.update_attributes(listing_params)
    end
    render_wizard @listing
  end

  private

  def listing_params
    params[:listing].permit(:book_id, :user_id)
  end
end
