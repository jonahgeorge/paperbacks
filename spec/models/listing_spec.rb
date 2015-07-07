require "rails_helper"

describe Listing, :type => :model do
  context "#with_title" do
    it "should return listings with similarly named books" do
      the_book_thief = FactoryGirl.create(:book, title: "The Book Thief")
      steal_this_book = FactoryGirl.create(:book, title: "Steal This Book")
      fahrenheit_451 = FactoryGirl.create(:book, title: "Fahrenheit 451")

      FactoryGirl.create_list(:listing, 5, :book => the_book_thief)
      FactoryGirl.create_list(:listing, 5, :book => steal_this_book)
      FactoryGirl.create_list(:listing, 5, :book => fahrenheit_451)

      listings = Listing.joins(:book).with_title("book")

      expect(listings.length).to eql(10)
    end

    it "should not return inactive listings" do
      book = FactoryGirl.create(:book)
      FactoryGirl.create_list(:listing, 5, :book => book, :is_active => true)
      FactoryGirl.create_list(:listing, 5, :book => book, :is_active => false)

      listings = Listing.joins(:book).with_title(book.title)

      expect(listings.length).to eql(5)
    end
  end
end
