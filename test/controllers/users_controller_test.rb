require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  context "on GET to :new" do
    setup do
      get :new
    end

    should respond_with :success
    should render_template :new
    should_not set_the_flash
  end

  context "when a user enters a blank preferred name" do
    setup do
      post :create, user: { email: "jonah@paperbacks.io", password: "keyboardcat" }
    end

    should render_template :new
    should_not set_the_flash
    should_not set_session("user_id")
  end

  context "when a user enters a blank email" do
    setup do
      post :create, user: { name: "Jonah", password: "keyboardcat" }
    end

    should render_template :new
    should_not set_the_flash
    should_not set_session("user_id")
  end

  context "when a user enters a blank password" do
    setup do
      post :create, user: { name: "Jonah", email: "jonah@paperbacks.io" }
    end

    should render_template :new
    should_not set_the_flash
    should_not set_session("user_id")
  end

  context "on valid user signup" do
    setup do
      post :create, user: { name: 'Jonah', email: "jonah@paperbacks.io", password: "keyboardcat" }
    end

    should redirect_to '/'
    should set_the_flash
    should set_session("user_id")
  end

end
