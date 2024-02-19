require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  test "is valid with valid attributes" do
    user = User.new(name: "Test User", email: "test@gmail.com", password: "123456")
    imagen_data = File.open(Rails.root.join('app', 'assets', 'images', 'uc.png'))
    product = Product.new(name: "Polera", price: 10000, description: "wena", image: imagen_data, id_vendedor: 9, cantidad_xs: 1, cantidad_s: 2, cantidad_m: 3, 
                          cantidad_l: 4, cantidad_xl: 5)
    review = Review.new(title: "Polera Linda", description: "muy muy linda", rating: 6, user: user, product: product)
    assert review.valid?
  end

  test "is not valid without a title" do
    user = User.new(name: "Test User", email: "test@gmail.com", password: "123456")
    imagen_data = File.open(Rails.root.join('app', 'assets', 'images', 'uc.png'))
    product = Product.new(name: "Polera", price: 10000, description: "wena", image: imagen_data, id_vendedor: 9, cantidad_xs: 1, cantidad_s: 2, cantidad_m: 3, 
                          cantidad_l: 4, cantidad_xl: 5)
    review = Review.new(description: "muy muy linda", rating: 6, user: user, product: product)
    assert_not review.valid?
  end

  test "is not valid without a rating" do
    user = User.new(name: "Test User", email: "test@gmail.com", password: "123456")
    imagen_data = File.open(Rails.root.join('app', 'assets', 'images', 'uc.png'))
    product = Product.new(name: "Polera", price: 10000, description: "wena", image: imagen_data, id_vendedor: 9, cantidad_xs: 1, cantidad_s: 2, cantidad_m: 3, 
                          cantidad_l: 4, cantidad_xl: 5)
    review = Review.new(title: "Polera Linda", description: "muy muy linda", user: user, product: product)
    assert_not review.valid?
  end

  test "is not valid without a user" do
    imagen_data = File.open(Rails.root.join('app', 'assets', 'images', 'uc.png'))
    product = Product.new(name: "Polera", price: 10000, description: "wena", image: imagen_data, id_vendedor: 9, cantidad_xs: 1, cantidad_s: 2, cantidad_m: 3, 
                          cantidad_l: 4, cantidad_xl: 5)
    review = Review.new(title: "Polera Linda", description: "muy muy linda", rating: 6, product: product)
    assert_not review.valid?
  end

  test "is not valid without a product" do
    user = User.new(name: "Test User", email: "test@gmail.com", password: "123456")
    review = Review.new(title: "Polera Linda", description: "muy muy linda", rating: 6, user: user)
    assert_not review.valid?
  end

  test "is valid with no description" do
    user = User.new(name: "Test User", email: "test@gmail.com", password: "123456")
    imagen_data = File.open(Rails.root.join('app', 'assets', 'images', 'uc.png'))
    product = Product.new(name: "Polera", price: 10000, description: "wena", image: imagen_data)
    review = Review.new(title: "Polera Linda", rating: 6, user: user, product: product)
    assert review.valid?
  end

  test "is not valid without any attribute" do
    review = Review.new()
    assert_not review.valid?
  end

end
