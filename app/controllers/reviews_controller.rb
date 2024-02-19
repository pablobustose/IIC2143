class ReviewsController < ApplicationController
  before_action :set_product, only: [:new, :create, :destroy]
  
    # GET /products/:product_id/reviews/new
  def new
    @review = Review.new
  end
  
    # POST /products/:product_id/reviews
  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.product = @product

    if @review.save
      redirect_to @product, notice: 'La reseña fue creada exitosamente.'
    else
      render :new
    end
  end
  
    # DELETE /products/:product_id/reviews/:id
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to @product, notice: 'La reseña fue eliminada exitosamente.'
  end
  
    private
  
  def set_product
    @product = Product.find(params[:product_id])
  end
  
  def review_params
    params.require(:review).permit(:title, :description, :rating)
  end
  end