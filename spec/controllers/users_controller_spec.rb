require "rails_helper"

describe UsersController, :type => :controller do
  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  # TODO Turn these into Capybara tests
  #
  # describe "POST #create" do
  #   describe "when a user enters a blank preferred name" do
  #     it "sets flash message and re-renders :new" do
  #       post :create, user: { email: "jonah@paperbacks.io", password: "keyboardcat" }
  #       expect(response).to be_success
  #       expect(response).to render_template("new")
  #     end
  #   end
  #   describe "when a user enters a blank email" do
  #     it "sets flash message and re-renders :new" do
  #       post :create, user: { name: "Jonah", password: "keyboardcat" }
  #       expect(response).to be_success
  #       expect(response).to render_template("new")
  #     end
  #   end
  #   describe "when a user enters a blank password" do
  #     it "sets flash message and re-renders :new" do
  #       post :create, user: { name: "Jonah", email: "jonah@paperbacks.io" }
  #       expect(response).to be_success
  #       expect(response).to render_template("new")
  #     end
  #   end
  #   describe "when a valid user signup occurs" do
  #     it "sets flash and redirects to /" do
  #       post :create, user: { name: 'Jonah', email: "jonah@paperbacks.io", password: "keyboardcat" }
  #       expect(response).to be_success
  #       expect(response).to redirect_to(root_path)
  #     end
  #   end
  # end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      user = FactoryGirl.create(:user)
      get :show, :id => user.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the show template" do
      user = FactoryGirl.create(:user)
      get :show, :id => user.id
      expect(response).to render_template("show")
    end

    it "loads the specified user into @user" do
      user = FactoryGirl.create(:user)
      get :show, :id => user.id
      expect(assigns(:user)).to eq(user)
    end

    it "loads the user's active listings into @listings" do
      user = FactoryGirl.create(:user)
      FactoryGirl.create_list(:listing, 5, :user => user, :is_active => false)
      active_listings = FactoryGirl.create_list(:listing, 5, :user => user)
      get :show, :id => user.id
      expect(assigns(:listings)).to match_array(active_listings)
    end
  end
end
