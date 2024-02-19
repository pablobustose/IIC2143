require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "is valid with valid attributes" do
    imagen_data = File.open(Rails.root.join('app', 'assets', 'images', 'uc.png'))
    product = Product.new(name: "Polera", price: 10000, description: "wena", image: imagen_data, id_vendedor: 9, cantidad_xs: 1, cantidad_s: 2, cantidad_m: 3, 
                          cantidad_l: 4, cantidad_xl: 5)
    assert_not product.valid?
  end

  test "is not valid without a name" do
    imagen_data = File.open(Rails.root.join('app', 'assets', 'images', 'uc.png'))
    product = Product.new(price: 10000, description: "wena", image: imagen_data, id_vendedor: 9, cantidad_xs: 1, cantidad_s: 2, cantidad_m: 3, cantidad_l: 4, 
                          cantidad_xl: 5)
    assert_not product.valid?
  end

  test "is not valid without a price" do
    imagen_data = File.open(Rails.root.join('app', 'assets', 'images', 'uc.png'))
    product = Product.new(name: "Polera", description: "wena", image: imagen_data, id_vendedor: 9, cantidad_xs: 1, cantidad_s: 2, cantidad_m: 3, cantidad_l: 4, 
                          cantidad_xl: 5)
    assert_not product.valid?
  end

  test "is not valid without a description" do
    imagen_data = File.open(Rails.root.join('app', 'assets', 'images', 'uc.png'))
    product = Product.new(name: "Polera", price: 10000, image: imagen_data, id_vendedor: 9, cantidad_xs: 1, cantidad_s: 2, cantidad_m: 3, cantidad_l: 4, cantidad_xl: 5)
    assert_not product.valid?
  end

  test "is not valid without an image" do
    product = Product.new(name: "Polera", price: 10000, description: "hola hola", id_vendedor: 9, cantidad_xs: 1, cantidad_s: 2, cantidad_m: 3, cantidad_l: 4, 
                          cantidad_xl: 5)
    assert_not product.valid?
  end

  test "is not valid without a cantidad_xs" do
    imagen_data = File.open(Rails.root.join('app', 'assets', 'images', 'uc.png'))
    product = Product.new(name: "Polera", price: 10000, description: "wena", image: imagen_data, id_vendedor: 9, cantidad_s: 2, cantidad_m: 3, cantidad_l: 4, 
                          cantidad_xl: 5)
    assert_not product.valid?
  end

  test "is not valid without a cantidad_s" do
    imagen_data = File.open(Rails.root.join('app', 'assets', 'images', 'uc.png'))
    product = Product.new(name: "Polera", price: 10000, description: "wena", image: imagen_data, id_vendedor: 9, cantidad_xs: 1, cantidad_m: 3, cantidad_l: 4, 
                          cantidad_xl: 5)
    assert_not product.valid?
  end

  test "is not valid without a cantidad_m" do
    imagen_data = File.open(Rails.root.join('app', 'assets', 'images', 'uc.png'))
    product = Product.new(name: "Polera", price: 10000, description: "wena", image: imagen_data, id_vendedor: 9, cantidad_xs: 1, cantidad_s: 2, cantidad_l: 4, 
                          cantidad_xl: 5)
    assert_not product.valid?
  end

  test "is not valid without a cantidad_l" do
    imagen_data = File.open(Rails.root.join('app', 'assets', 'images', 'uc.png'))
    product = Product.new(name: "Polera", price: 10000, description: "wena", image: imagen_data, id_vendedor: 9, cantidad_xs: 1, cantidad_s: 2, cantidad_m: 3, 
                          cantidad_xl: 5)
    assert_not product.valid?
  end

  test "is not valid without a cantidad_xl" do
    imagen_data = File.open(Rails.root.join('app', 'assets', 'images', 'uc.png'))
    product = Product.new(name: "Polera", price: 10000, description: "wena", image: imagen_data, id_vendedor: 9, cantidad_xs: 1, cantidad_s: 2, cantidad_m: 3, 
                          cantidad_l: 4)
    assert_not product.valid?
  end

  test "is not valid without a id_vendedor" do
    imagen_data = File.open(Rails.root.join('app', 'assets', 'images', 'uc.png'))
    product = Product.new(name: "Polera", price: 10000, description: "wena", image: imagen_data, cantidad_xs: 1, cantidad_s: 2, cantidad_m: 3, cantidad_l: 4, 
                          cantidad_xl: 5)
    assert_not product.valid?
  end

  test "is not valid without attributes" do
    product = Product.new()
    assert_not product.valid?
  end

  test "validates uniqueness of name" do
    Product.create(name: "Polera", price: 10000, description: "wena")
    product2 = Product.new(name: "Polera", price: 100, description: "nuevo")
    assert_not product2.valid?
  end

end
