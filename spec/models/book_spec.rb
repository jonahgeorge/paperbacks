require 'rails_helper'

describe Book, :type => :model do
  context '#where_title_like' do
    it 'should return similarly named books' do
      the_book_thief = FactoryGirl.create(:book, title: 'The Book Thief')
      steal_this_book = FactoryGirl.create(:book, title: 'Steal This Book')
      fahrenheit_451 = FactoryGirl.create(:book, title: 'Fahrenheit 451')

      books = Book.where_title_like('Book')

      expect(books).to include(the_book_thief)
      expect(books).to include(steal_this_book)
      expect(books).to_not include(fahrenheit_451)
    end
  end

  context '#active_listings' do
    it 'should return only active listings' do
      book = FactoryGirl.create(:book)
      FactoryGirl.create_list(:listing, 2, book: book, is_active: true)
      FactoryGirl.create_list(:listing, 5, book: book, is_active: false)

      expect(book.active_listings.length).to eql(2)
    end
  end

  context '#inactive_listings' do
    it 'should return only inactive listings' do
      book = FactoryGirl.create(:book)
      FactoryGirl.create_list(:listing, 2, book: book, is_active: true)
      FactoryGirl.create_list(:listing, 5, book: book, is_active: false)

      expect(book.inactive_listings.length).to eql(5)
    end
  end
end
