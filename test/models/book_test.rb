require 'test_helper'

class BookTest < ActiveSupport::TestCase

  context "a book" do
    
    should have_many(:listings)
    should validate_uniqueness_of(:isbn)
    should validate_presence_of(:title)
    should validate_presence_of(:isbn)
    
    should "return similarly named users for with_name" do
      jonah = User.create(name: "Jonah", email: "jonah@paperbacks.trade", password: "test")
      john = User.create(name: "John", email: "john@paperbacks.trade", password: "test")
      kathrine = User.create(name: "Kathrine", email: "kathrine@paperbacks.trade", password: "test")
      
      users = User.with_name("Jo")
      
      assert_not users.include?(kathrine), "Kathrine was in the results"
      assert users.include?(john), "John was not in the results"
      assert users.include?(jonah), "Jonah was not in the results"
    end
    
  end

end
