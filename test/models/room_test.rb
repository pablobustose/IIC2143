require "test_helper"

class RoomTest < ActiveSupport::TestCase
  test "is valid with all attributes" do
    user = User.new(name: "Test User", email: "test@gmail.com", password: "123456")
    room = Room.new(name: "Test Room", user: user, email_cliente: "test@gmail.com", id_vendedor: 1, id_cliente: 10, nombre_vendedor: "Pepito")
    assert room.valid?
  end
end
