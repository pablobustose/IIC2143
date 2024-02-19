class Request < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :product, :talla, presence: true
end