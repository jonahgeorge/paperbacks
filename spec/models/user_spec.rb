require "rails_helper"

describe User, :type => :model do
  context "#with_name" do
    it "should return similarly named users" do
      jonah = FactoryGirl.create(:user, name: "Jonah")
      john = FactoryGirl.create(:user, name: "John")
      kathrine = FactoryGirl.create(:user, name: "Kathrine")

      users = User.with_name("Jo")

      expect(users).to include(john)
      expect(users).to include(jonah)
      expect(users).to_not include(kathrine)
    end
  end

  context "#active_listings" do
    it "should return only active listings" do
      user = FactoryGirl.create(:user)
      FactoryGirl.create_list(:listing, 2, :user => user, :is_active => true)
      FactoryGirl.create_list(:listing, 4, :user => user, :is_active => false)

      expect(user.active_listings.length).to eql(2)
    end
  end

  context "#inactive_listings" do
    it "should return only inactive listings" do
      user = FactoryGirl.create(:user)
      FactoryGirl.create_list(:listing, 2, :user => user, :is_active => true)
      FactoryGirl.create_list(:listing, 4, :user => user, :is_active => false)

      expect(user.inactive_listings.length).to eql(4)
    end
  end
end
