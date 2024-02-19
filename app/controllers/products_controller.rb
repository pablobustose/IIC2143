class ProductsController < ApplicationController
  # GET /products
  def index
    @products = Product.all
    @available_sizes = available_sizes

    if params[:size].present?
      case params[:size]
      when "XS"
        @products = @products.where("cantidad_xs > 0")
      when "S"
        @products = @products.where("cantidad_s > 0")
      when "M"
        @products = @products.where("cantidad_m > 0")
      when "L"
        @products = @products.where("cantidad_l > 0")
      when "XL"
        @products = @products.where("cantidad_xl > 0")
      end
    end
  end

  # GET /products/new
  def new
    @product = Product.new
  end
  # POST /products
  def create
    @product = Product.new(product_params)
    if @product.save
      logger.info "redirect"
      redirect_to product_url(@product), notice: "Product was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
  # GET /products/:id
  def show
    @product = Product.find(params[:id])
  end
  #GET /products/:id/edit
  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_url(@product), notice: "Product was successfully updated."
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url, notice: "Product was successfully destroyed."
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :description, :image, :id_vendedor, :cantidad_xs, :cantidad_s, :cantidad_m, :cantidad_l, :cantidad_xl)
  end

  def available_sizes
    sizes = []
    sizes << "XS" if Product.where("cantidad_xs > 0").exists?
    sizes << "S" if Product.where("cantidad_s > 0").exists?
    sizes << "M" if Product.where("cantidad_m > 0").exists?
    sizes << "L" if Product.where("cantidad_l > 0").exists?
    sizes << "XL" if Product.where("cantidad_xl > 0").exists?
    sizes
  end
end
