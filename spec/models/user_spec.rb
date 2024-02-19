require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with all atributes" do
    user = User.new(name: "Test User", email: "test@gmail.com", password: "123456")
    expect(user).to be_valid
  end

  it "is not valid without a name" do
    user = User.new(email: "test@gmail.com", password: "123456")
    expect(user).to_not be_valid
  end

  it "is not valid without an email" do
    user = User.new(name: "Test User", password: "123456")
    expect(user).to_not be_valid
  end

  it "is not valid without a password" do
    user = User.new(name: "Test User", email: "test@gmail.com")
    expect(user).to_not be_valid
  end

  it "is valid without an image" do
    user = User.new(name: "Test User", email: "test@gmail.com", password: "123456")
    expect(user).to be_valid
  end

end
