require 'test_helper'

class ListingTest < ActiveSupport::TestCase

  context "a listing" do
    
    should belong_to(:user)
    should belong_to(:book)
    should validate_presence_of(:user)
    should validate_presence_of(:book)
    should validate_presence_of(:price)
    
  end

end
