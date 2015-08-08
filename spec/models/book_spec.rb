require 'rails_helper'

describe Book, type: :model do
  context '#by_title' do
    it 'should return similarly named books' do
      the_book_thief = FactoryGirl.create(:book, title: 'The Book Thief')
      steal_this_book = FactoryGirl.create(:book, title: 'Steal This Book')
      fahrenheit_451 = FactoryGirl.create(:book, title: 'Fahrenheit 451')

      books = Book.by_title('Book')

      expect(books).to include(the_book_thief)
      expect(books).to include(steal_this_book)
      expect(books).to_not include(fahrenheit_451)
    end
  end
end
