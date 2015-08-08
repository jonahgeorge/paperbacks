require "rails_helper"

describe ListingsController, type: :controller do
  describe "#index" do
    it "renders the index page" do
      get :index
      expect(response).to render_template "index"
      expect(response.status).to eq(200)
    end

    # it "populates @listings based on search term" do
    #   b1 = FactoryGirl.create(:book, title: "The Book Thief")
    #   b2 = FactoryGirl.create(:book, title: "Steal This Book")
    #   b3 = FactoryGirl.create(:book, title: "Fahrenheit 451")
    #   l1 = FactoryGirl.create(:listing, book: b1)
    #   l2 = FactoryGirl.create(:listing, book: b2)
    #   l3 = FactoryGirl.create(:listing, book: b3)
    #   get :index, q: "book"
    #   expect(assigns(:listings)).to match_array([l1, l2])
    # end
  end
end
