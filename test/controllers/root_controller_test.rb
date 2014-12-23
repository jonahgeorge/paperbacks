require 'test_helper'

class RootControllerTest < ActionController::TestCase

  context "on GET to :home" do

    setup do
      get :home
    end

    should respond_with :success
    should render_template :home
    should_not set_the_flash

  end

end
