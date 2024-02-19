require 'rails_helper'

RSpec.describe Request, type: :model do

    it "is valid with valid attributes" do
      imagen_data =  File.open(Rails.root.join('app', 'assets', 'images', 'uc.png'))
      product = Product.new(name: "Polera", price: 10000, description: "wena", image: imagen_data)
      expect(product).to be_valid
    end  

  end
