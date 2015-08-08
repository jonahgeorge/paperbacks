require 'rails_helper'

describe Listing, type: :model do
  context '#by_title' do
    it 'returns listings with similarly named books' do
      the_book_thief = FactoryGirl.create(:book, title: 'The Book Thief')
      steal_this_book = FactoryGirl.create(:book, title: 'Steal This Book')
      fahrenheit_451 = FactoryGirl.create(:book, title: 'Fahrenheit 451')

      FactoryGirl.create_list(:listing, 5, book: the_book_thief)
      FactoryGirl.create_list(:listing, 5, book: steal_this_book)
      FactoryGirl.create_list(:listing, 5, book: fahrenheit_451)

      listings = Listing.by_title('book')

      expect(listings.length).to eql(10)
    end
  end

  context "#active" do
    it 'returns active listings' do
      book = FactoryGirl.create(:book)
      FactoryGirl.create_list(:listing, 5, book: book, active: true)
      FactoryGirl.create_list(:listing, 10, book: book, active: false)

      listings = Listing.active

      expect(listings.length).to eql(5)
    end
  end

  context "#inactive" do
    it 'returns inactive listings' do
      book = FactoryGirl.create(:book)
      FactoryGirl.create_list(:listing, 10, book: book, active: true)
      FactoryGirl.create_list(:listing, 5, book: book, active: false)

      listings = Listing.inactive

      expect(listings.length).to eql(5)
    end
  end
end
