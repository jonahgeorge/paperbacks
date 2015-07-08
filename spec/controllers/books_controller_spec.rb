require "rails_helper"

describe BooksController, :type => :controller do
  describe "#show" do
    it "renders an individual book page" do
      book = FactoryGirl.create(:book)
      get :show, :id => book.id
      expect(response).to render_template "show"
      expect(response.status).to eq(200)
    end
  end
end
