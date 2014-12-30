require 'test_helper'

class BookTest < ActiveSupport::TestCase

  context "a book" do

    should have_many(:listings)
    should validate_uniqueness_of(:isbn)
    should validate_presence_of(:title)
    should validate_presence_of(:isbn)

    should "return similarly titled books for with_title" do
      the_book_thief = Book.create(
        title: "The Book Thief",
        isbn: "9780375842207"
      )

      steal_this_book = Book.create(
        title: "Steal This Book",
        isbn: "9780899667775"
      )

      fahrenheit_451 = Book.create(
        title: "Fahrenheit 451",
        isbn: "9781451673319"
      )

      books = Book.with_title("Book")

      assert_not(
        books.include?(fahrenheit_451),
        "fahrenheit_451 was in the results"
      )

      assert(
        books.include?(steal_this_book),
        "steal_this_book was not in the results"
      )

      assert(
        books.include?(the_book_thief),
        "the_book_thief was not in the results"
      )
    end

    should "return no books for with_title" do
      the_book_thief = Book.create(
        title: "The Book Thief",
        isbn: "9780375842207"
      )

      steal_this_book = Book.create(
        title: "Steal This Book",
        isbn: "9780899667775"
      )

      fahrenheit_451 = Book.create(
        title: "Fahrenheit 451",
        isbn: "9781451673319"
      )

      books = Book.with_title("Dog")

      assert_not(
        books.include?(fahrenheit_451),
        "fahrenheit_451 was in the results"
      )

      assert_not(
        books.include?(steal_this_book),
        "steal_this_book was not in the results"
      )

      assert_not(
        books.include?(the_book_thief),
        "the_book_thief was not in the results"
      )
    end

    should "return active listings for active_listing" do
      kathrine = User.create(
        name: "Kathrine",
        email: "kathrine@paperbacks.trade",
        password: "test"
      )

      jonah = User.create(
        name: "Jonah",
        email: "jonah@paperbacks.trade",
        password: "test"
      )

      john = User.create(
        name: "John",
        email: "john@paperbacks.trade",
        password: "test"
      )

      book = Book.create(
        title: "The Book Thief",
        isbn: "9780375842207"
      )

      listing1 = Listing.create(
        user: kathrine,
        book: book,
        price: 19.99,
        is_active: true
      )

      listing2 = Listing.create(
        user: jonah,
        book: book,
        price: 19.99,
        is_active: true
      )

      listing3 = Listing.create(
        user: john,
        book: book,
        price: 29.99,
        is_active: false
      )

      listings = book.active_listings

      assert_not(
        listings.include?(listing3),
        "An inactive listings was included in active_listings"
      )

      assert(
        listings.include?(listing1),
        "An active listings was not included in active_listings"
      )

      assert(
        listings.include?(listing2),
        "An active listings was not included in active_listings"
      )
    end

    should "return inactive listings for inactive_listing" do
      kathrine = User.create(
        name: "Kathrine",
        email: "kathrine@paperbacks.trade",
        password: "test"
      )

      jonah = User.create(
        name: "Jonah",
        email: "jonah@paperbacks.trade",
        password: "test"
      )

      john = User.create(
        name: "John",
        email: "john@paperbacks.trade",
        password: "test"
      )

      book = Book.create(
        title: "The Book Thief",
        isbn: "9780375842207"
      )

      listing1 = Listing.create(
        user: kathrine,
        book: book,
        price: 19.99,
        is_active: true
      )

      listing2 = Listing.create(
        user: jonah,
        book: book,
        price: 19.99,
        is_active: false
      )

      listing3 = Listing.create(
        user: john,
        book: book,
        price: 29.99,
        is_active: false
      )

      listings = book.inactive_listings

      assert_not(
        listings.include?(listing1),
        "An active listings was included in inactive_listings"
      )

      assert(
        listings.include?(listing3),
        "An inactive listings was not included in inactive_listings"
      )

      assert(
        listings.include?(listing2),
        "An inactive listings was not included in inactive_listings"
      )
    end

  end

end
