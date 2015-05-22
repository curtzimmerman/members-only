require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
  	@user = User.new(name: "Example User", email: "example@user.net", password: "foobar", password_confirmation: "foobar", member: true)
  end

  test "should be valid" do
  	assert @user.valid?
  end

  test "should have name" do
  	@user.name = "  "
  	assert_not @user.valid?
  end

  test "should have email" do
  	@user.email = "foobar.ne@t"
  	assert_not @user.valid?
  end

  test "member should be true" do
  	@user.member = false
  	assert_not @user.valid?
  end
end
