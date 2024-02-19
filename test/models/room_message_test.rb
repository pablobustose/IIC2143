require "test_helper"

class RoomMessageTest < ActiveSupport::TestCase
  test "is valid with all attributes" do
    user = User.new(name: "Test User", email: "test@gmail.com", password: "123456")
    Room.new(name: "Test Room", user: user, email_cliente: "test@gmail.com", id_vendedor: 1, id_cliente: 10, nombre_vendedor: "Pepito")
    room_message = RoomMessage.new(content: "Hola", user_id: 10, room_id: 100)
    assert room_message.valid?
  end
end
