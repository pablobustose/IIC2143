require "test_helper"

class RequestTest < ActiveSupport::TestCase
  test "is valid with valid attributes" do
    imagen_data = File.open(Rails.root.join('app', 'assets', 'images', 'uc.png'))
    product = Product.new(name: "Polera", price: 10000, description: "wena", image: imagen_data, id_vendedor: 9, cantidad_xs: 1, cantidad_s: 2, cantidad_m: 3, 
                          cantidad_l: 4, cantidad_xl: 5)
    request = Request.new(product: product, talla: "M")
    assert request.valid?
  end
  
  test "is not valid without a talla" do
    imagen_data = File.open(Rails.root.join('app', 'assets', 'images', 'uc.png'))
    product = Product.new(name: "Polera", price: 10000, description: "wena", image: imagen_data, id_vendedor: 9, cantidad_xs: 1, cantidad_s: 2, cantidad_m: 3, 
                          cantidad_l: 4, cantidad_xl: 5)
    request = Request.new(product: product)
    assert_not request.valid?
  end
  
end
