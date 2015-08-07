require "rails_helper"

describe PagesController do

  describe "GET index" do
    it "renders the index template" do
      get :index

      expect(response).to render_template("index")
      expect(response.status).to eq(200)
    end
  end

end
