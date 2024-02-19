require 'rails_helper'

RSpec.describe Room, type: :model do

  it "is valid with all atributes" do
    user = User.new(name: "Test User", email: "test@gmail.com", password: "123456")
    room = Room.new(name: "Test Room", user: user)
    expect(room).to be_valid
  end
end
