class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :title, :rating, presence: true
end