require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "gets home page" do
  	get :home
  	assert_response :success
  end
end
