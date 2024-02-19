require 'rails_helper'

RSpec.describe Product, type: :model do
  it "is valid with valid attributes" do
    imagen_data =  File.open(Rails.root.join('app', 'assets', 'images', 'uc.png'))
    product = Product.new(name: "Polera", price: 10000, description: "wena", image: imagen_data)
    expect(product).to be_valid
  end

  it "is not valid without a name" do
    imagen_data =  File.open(Rails.root.join('app', 'assets', 'images', 'uc.png'))
    product = Product.new(price: 10000, description: "wena", image: imagen_data )
    expect(product).to_not be_valid
  end

  it "is not valid without a price" do
    imagen_data =  File.open(Rails.root.join('app', 'assets', 'images', 'uc.png'))
    product = Product.new(name: "Polera", description: "wena", image: imagen_data )
    expect(product).to_not be_valid
  end

  it "is not valid without a description" do
    imagen_data =  File.open(Rails.root.join('app', 'assets', 'images', 'uc.png'))
    product = Product.new(name: "Polera", price: 10000, image: imagen_data)
    expect(product).to_not be_valid
  end

  it "is not valid without a image" do
    product = Product.new(name: "Polera", price: 10000, description: "hola hola")
    expect(product).to_not be_valid
  end

  it "is not valid without atributes" do
    product = Product.new()
    expect(product).to_not be_valid
  end

  it "validates uniqueness of name" do
    Product.create(name: "Polera", price: 10000, description: "wena")
    product2 = Product.new(name: "Polera", price: 100, description: "nuevo")
    expect(product2).to_not be_valid
  end

end