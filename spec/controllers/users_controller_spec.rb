require "rails_helper"

describe UsersController, :type => :controller do
  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      user = FactoryGirl.create(:user)
      get :show, id: user.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the show template" do
      user = FactoryGirl.create(:user)
      get :show, id: user.id
      expect(response).to render_template("show")
    end

    it "populates @user" do
      user = FactoryGirl.create(:user)
      get :show, id: user.id
      expect(assigns(:user)).to eq(user)
    end

    it "populates @listings" do
      user = FactoryGirl.create(:user)
      inactive_listings = FactoryGirl.create_list(:listing, 5, user: user, active: false)
      active_listings = FactoryGirl.create_list(:listing, 5, user: user, active: true)
      get :show, id: user.id
      expect(assigns(:listings)).to match_array(active_listings)
    end
  end
end
