class Product < ApplicationRecord
  validates :name, :price, :description, :image, :id_vendedor, :cantidad_xs, :cantidad_s, :cantidad_m, :cantidad_l, :cantidad_xl, presence: true
  validates :name, uniqueness: true
  has_many :reviews, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_one_attached :image
  belongs_to :vendedor, class_name: 'User', foreign_key: :id_vendedor
  include ImageUploader::Attachment(:image)
end