require 'open-uri'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  validates :name, presence: true
  has_many :reviews, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :rooms_as_vendedor, class_name: 'Room', foreign_key: :id_vendedor, dependent: :destroy
  has_many :rooms_as_cliente, class_name: 'Room', foreign_key: :id_cliente, dependent: :destroy
  has_many :room_messages, dependent: :destroy
  has_many :compras_as_vendedor, class_name: 'Compra', foreign_key: :id_vendedor, dependent: :destroy
  has_many :compras_as_cliente, class_name: 'Compra', foreign_key: :id_cliente, dependent: :destroy
  has_many :products, foreign_key: 'id_vendedor', dependent: :destroy
  include ImageUploader::Attachment(:image)
  after_create :assign_default_image_url

  def assign_default_image_url
    default_image_url = "https://i.ibb.co/r4qXG3j/defaultt.jpg"
    image_attacher.assign(URI.open(default_image_url))
  end
end
