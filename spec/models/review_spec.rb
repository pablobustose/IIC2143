require 'rails_helper'

RSpec.describe Review, type: :model do
  it "is valid with valid attributes" do
    user = User.new(name: "Test User", email: "test@gmail.com", password: "123456")
    imagen_data =  File.open(Rails.root.join('app', 'assets', 'images', 'uc.png'))
    product = Product.new(name: "Polera", price: 10000, description: "wena", image: imagen_data)
    review = Review.new(title: "Polera Linda", description: "muy muy linda", rating: 6, user: user, product: product)
    expect(review).to be_valid
  end

  it "is not valid without a title" do
    user = User.new(name: "Test User", email: "test@gmail.com", password: "123456")
    imagen_data =  File.open(Rails.root.join('app', 'assets', 'images', 'uc.png'))
    product = Product.new(name: "Polera", price: 10000, description: "wena", image: imagen_data)
    review = Review.new(description: "muy muy linda", rating: 6, user: user, product: product)
    expect(review).to_not be_valid
  end

  it "is not valid without a rating" do
    user = User.new(name: "Test User", email: "test@gmail.com", password: "123456")
    imagen_data =  File.open(Rails.root.join('app', 'assets', 'images', 'uc.png'))
    product = Product.new(name: "Polera", price: 10000, description: "wena", image: imagen_data)
    review = Review.new(title: "Polera Linda", description: "muy muy linda", user: user, product: product)
    expect(review).to_not be_valid
  end

  it "is not valid without a user" do
    imagen_data =  File.open(Rails.root.join('app', 'assets', 'images', 'uc.png'))
    product = Product.new(name: "Polera", price: 10000, description: "wena", image: imagen_data)
    review = Review.new(title: "Polera Linda", description: "muy muy linda", rating: 6, product: product)
    expect(review).to_not be_valid
  end

  it "is not valid without a product" do
    user = User.new(name: "Test User", email: "test@gmail.com", password: "123456")
    review = Review.new(title: "Polera Linda", description: "muy muy linda", rating: 6, user: user)
    expect(review).to_not be_valid
  end

  it "is valid with no description" do
    user = User.new(name: "Test User", email: "test@gmail.com", password: "123456")
    imagen_data =  File.open(Rails.root.join('app', 'assets', 'images', 'uc.png'))
    product = Product.new(name: "Polera", price: 10000, description: "wena", image: imagen_data)
    review = Review.new(title: "Polera Linda", rating: 6, user: user, product: product)
    expect(review).to be_valid
  end

  it "is not valid without any atribute" do
    review = Review.new()
    expect(review).to_not be_valid
  end

end