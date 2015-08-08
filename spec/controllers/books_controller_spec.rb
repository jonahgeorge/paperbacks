require "rails_helper"

describe BooksController, type: :controller do
  describe "#index" do
    it "renders the book search page" do
      get :index
      expect(response).to render_template "index"
      expect(response.status).to eq(200)
    end
  end


  describe "#show" do
    it "renders an individual book page" do
      book = FactoryGirl.create(:book)
      get :show, :id => book.id
      expect(response).to render_template "show"
      expect(response.status).to eq(200)
    end
  end
end
