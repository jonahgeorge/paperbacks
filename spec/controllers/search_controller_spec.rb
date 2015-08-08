require "rails_helper"

describe SearchController, type: :controller do
  describe "#index" do
    it "renders the search page" do
      get :index
      expect(response).to render_template "index"
      expect(response.status).to eq(200)
    end

    # it "populates @listings" do
    #   listings = FactoryGirl.create_list(:listing, 5)
    #   get :index
    #   expect(assigns(:listings)).to match_array(listings)
    # end

    # it "populates @books" do
    #   books = FactoryGirl.create_list(:book, 5)
    #   get :index
    #   expect(assigns(:books)).to match_array(books)
    # end
  end
end
