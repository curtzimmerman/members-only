require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = User.new(name: "foobar", email: "foo@bar.com", password: "foobar", password_confirmation: "foobar", member: true)
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
  	puts @user.inspect
  	assert_not @user.valid?
  end
end
