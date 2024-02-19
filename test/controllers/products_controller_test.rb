require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
    assert_not_nil assigns(:products)
  end
  
  test "should get show" do
    product = Product.create(name: "Test Product", price: 10, description: "wena", id_vendedor: 9,talla: "M")
    get :show, params: { id: product.id }
    assert_response :success
    assert_template :show
    assert_equal product, assigns(:product)
  end
  
  test "should create product with valid attributes" do
    assert_difference('Product.count') do
      post :create, params: { product: { name: "New Product", price: 10, description: "wena", id_vendedor: 9, talla: "M" } }
    end
    assert_redirected_to Product.last
  end
  
  test "should not create product with invalid attributes" do
    assert_no_difference('Product.count') do
      post :create, params: { product: { name: nil, price: 10, description: "wena", id_vendedor: 9, talla: "M" } }
    end
    assert_template :new
  end
end

