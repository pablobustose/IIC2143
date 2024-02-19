require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "is valid with all attributes" do
    user = User.new(name: "Test User", email: "test@gmail.com", password: "123456")
    assert user.valid?
  end

  test "is not valid without a name" do
    user = User.new(email: "test@gmail.com", password: "123456")
    assert_not user.valid?
  end

  test "is not valid without an email" do
    user = User.new(name: "Test User", password: "123456")
    assert_not user.valid?
  end

  test "is not valid without a password" do
    user = User.new(name: "Test User", email: "test@gmail.com")
    assert_not user.valid?
  end

  test "is valid without an image" do
    user = User.new(name: "Test User", email: "test@gmail.com", password: "123456")
    assert user.valid?
  end
  
end
