class Room < ApplicationRecord
  has_many :room_messages, dependent: :destroy, inverse_of: :room
  validates :name, :id_vendedor, presence: true
  belongs_to :vendedor, class_name: 'User', foreign_key: :id_vendedor
  belongs_to :cliente, class_name: 'User', foreign_key: :id_cliente
end
