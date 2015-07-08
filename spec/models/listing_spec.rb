require 'rails_helper'

describe Listing, type: :model do
  context '#where_title_like' do
    it 'returns listings with similarly named books' do
      the_book_thief = FactoryGirl.create(:book, title: 'The Book Thief')
      steal_this_book = FactoryGirl.create(:book, title: 'Steal This Book')
      fahrenheit_451 = FactoryGirl.create(:book, title: 'Fahrenheit 451')

      FactoryGirl.create_list(:listing, 5, book: the_book_thief)
      FactoryGirl.create_list(:listing, 5, book: steal_this_book)
      FactoryGirl.create_list(:listing, 5, book: fahrenheit_451)

      listings = Listing.where_title_like('book')

      expect(listings.length).to eql(10)
    end
  end

  context "#where_active" do
    it 'returns active listings' do
      book = FactoryGirl.create(:book)
      FactoryGirl.create_list(:listing, 5, book: book, is_active: true)
      FactoryGirl.create_list(:listing, 5, book: book, is_active: false)

      listings = Listing.where_active

      expect(listings.length).to eql(5)
    end
  end
end
