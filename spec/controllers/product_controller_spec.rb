require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end
    
    it "assigns all products as @products" do
      product1 = Product.create(name: "Product 1", price: 10, description: "wena")
      product2 = Product.create(name: "Product 2")
      
      get :index
      expect(assigns(:products)).to eq([product1, product2])
    end
  end
  
  describe "GET #show" do
    it "assigns the requested product as @product" do
      product = Product.create(name: "Test Product", price: 10, description: "wena")
      
      get :show, params: { id: product.id }
      expect(assigns(:product)).to eq(product)
    end
    
    it "renders the show template" do
      product = Product.create(name: "Test Product", price: 10, description: "wena")
      
      get :show, params: { id: product.id }
      expect(response).to render_template(:show)
    end
  end
  
  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new product" do
        expect {
          post :create, params: { product: { name: "New Product", price: 10, description: "wena" } }
        }.to change(Product, :count).by(1)
      end
      
      it "redirects to the created product" do
        post :create, params: { product: { name: "New Product", price: 10, description: "wena" } }
        expect(response).to redirect_to(Product.last)
      end
    end
    
    context "with invalid attributes" do
      it "does not create a new product" do
        expect {
          post :create, params: { product: { name: nil, price: 10, description: "wena" } }
        }.to_not change(Product, :count)
      end
      
      it "renders the new template" do
        post :create, params: { product: { name: nil, price: 10, description: "wena" } }
        expect(response).to render_template(:new)
      end
    end
  end
end
