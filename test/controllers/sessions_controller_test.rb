require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  context "on GET to :new" do
    setup do
      get :new
    end

    should respond_with :success
    should render_template :new
    should_not set_the_flash
  end

  context "when a user enters a blank email" do
    setup do
      user = User.create(name: "Jonah", email: "jonah@paperbacks.io", password: "keyboardcat")
      user.save

      post :create, { email: "", password: "keyboardcat" }
    end

    should render_template :new
    should set_the_flash.now
    should_not set_session("user_id")
  end

  context "when a user enters a blank password" do
    setup do
      user = User.create(name: "Jonah", email: "jonah@paperbacks.io", password: "keyboardcat")
      user.save

      post :create, { name: "Jonah", email: "jonah@paperbacks.io" }
    end

    should render_template :new
    should set_the_flash.now
    should_not set_session("user_id")
  end

  context "on valid user login" do
    setup do
      user = User.create(name: "Jonah", email: "jonah@paperbacks.io", password: "keyboardcat")
      user.save

      post :create, { email: "jonah@paperbacks.io", password: "keyboardcat" }
    end

    should redirect_to "/"
    should set_the_flash
    should set_session("user_id")
  end

  context "on GET to :destroy" do
    setup do
      user = User.create(name: "Jonah", email: "jonah@paperbacks.io", password: "keyboardcat")
      user.save

      post :create, { email: "jonah@paperbacks.io", password: "keyboardcat" }
      get :destroy
    end

    should redirect_to "/"
    should set_session("user_id").to(nil)
  end

end
