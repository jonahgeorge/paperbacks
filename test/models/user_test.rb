require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  context "a user" do
    
    should have_many(:listings)
    should validate_uniqueness_of(:email)
    should validate_presence_of(:email)
    should validate_presence_of(:name)

    should "return similarly named users for with_name" do
      jonah = User.create(name: "Jonah", email: "jonah@paperbacks.trade", password: "test")
      john = User.create(name: "John", email: "john@paperbacks.trade", password: "test")
      kathrine = User.create(name: "Kathrine", email: "kathrine@paperbacks.trade", password: "test")
      
      users = User.with_name("Jo")
      
      assert_not users.include?(kathrine), "Kathrine was in the results"
      assert users.include?(john), "John was not in the results"
      assert users.include?(jonah), "Jonah was not in the results"
    end
    
    should "return only active listings for active_listings" do
      kathrine = User.create(name: "Kathrine", email: "kathrine@paperbacks.trade", password: "test")

      the_book_thief = Book.create(title: "The Book Thief", isbn: "9780375842207")
      steal_this_book = Book.create(title: "Steal This Book", isbn: "9780899667775")
      fahrenheit_451 = Book.create(title: "Fahrenheit 451", isbn: "9781451673319")

      the_book_thief_listing = Listing.create(user: kathrine, book: the_book_thief, price: 19.99, is_active: true)
      steal_this_book_listing = Listing.create(user: kathrine, book: steal_this_book, price: 29.99, is_active: false)
      fahrenheit_451_listing = Listing.create(user: kathrine, book: fahrenheit_451, price: 39.99, is_active: true)

      listings = kathrine.active_listings

      assert_not listings.include?(steal_this_book_listing), "An inactive listings was included in active_listings (steal_this_book)"
      assert listings.include?(the_book_thief_listing), "An active listings was not included in active_listings (the_book_thief)"
      assert listings.include?(fahrenheit_451_listing), "An active listings was not included in active_listings (fahrenheit_451)"
    end

    should "return only inactive listings for inactive_listings" do
      john = User.create(name: "John", email: "john@paperbacks.trade", password: "test")

      the_book_thief = Book.create(title: "The Book Thief", isbn: "9780375842207")
      steal_this_book = Book.create(title: "Steal This Book", isbn: "9780899667775")
      fahrenheit_451 = Book.create(title: "Fahrenheit 451", isbn: "9781451673319")

      the_book_thief_listing = Listing.create(user: john, book: the_book_thief, price: 19.99, is_active: false)
      steal_this_book_listing = Listing.create(user: john, book: steal_this_book, price: 29.99, is_active: false)
      fahrenheit_451_listing = Listing.create(user: john, book: fahrenheit_451, price: 39.99, is_active: true)

      listings = john.inactive_listings

      assert_not listings.include?(fahrenheit_451_listing), "An inactive listings was included in active_listings"
      assert listings.include?(the_book_thief_listing), "An active listings was not included in active_listings"
      assert listings.include?(steal_this_book_listing), "An active listings was not included in active_listings"
    end

  end
  
end
