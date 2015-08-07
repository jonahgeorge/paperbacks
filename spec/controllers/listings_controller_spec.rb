require "rails_helper"

describe ListingsController, :type => :controller do
  describe "#index" do
    it "renders the index page" do
      get :index
      expect(response).to render_template "index"
      expect(response.status).to eq(200)
    end
  end
end