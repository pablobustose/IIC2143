class RoomMessage < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :room, presence: true
end
