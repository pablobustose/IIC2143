class Compra < ApplicationRecord
  belongs_to :vendedor, class_name: 'User', foreign_key: :id_vendedor
  belongs_to :cliente, class_name: 'User', foreign_key: :id_cliente
  validates :id_cliente, :id_vendedor, :talla, :status, presence: true
end
