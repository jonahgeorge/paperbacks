require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  context "on GET to /join" do

    setup do
      get :new
    end

    should respond_with :success
    should render_template :new
    should_not set_the_flash

  end

  context "on POST to /join" do

    setup do
      post :create, user: { name: 'Jonah', email: "jonah@paperbacks.io", password: "keyboardcat" }
    end

    should redirect_to '/'
    should set_the_flash
    should set_session("user_id")

  end

end
