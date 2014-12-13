require 'test_helper'

class ListingTest < ActiveSupport::TestCase

  context "a listing" do
    
    should belong_to(:user)
    should belong_to(:book)
    should validate_presence_of(:user)
    should validate_presence_of(:book)
    should validate_presence_of(:price)
    should validate_numericality_of(:price).is_greater_than_or_equal_to(0)

  end

end
