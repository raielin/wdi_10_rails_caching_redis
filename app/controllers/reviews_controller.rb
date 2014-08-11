class ReviewsController < ApplicationController
  respond_to :html, :json
  before_action :set_product
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    respond_with(@product.reviews)
  end

  def show
    respond_with(@review)
  end

  def new
    @review = @product.reviews.new
  end

  def edit
  end

  def create
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = 'Review created!'
    end
    respond_with(@review, location: @product)
  end

  def update
    if @review.update(review_params)
      flash[:notice] = 'Review updated!'
    end
    respond_with(@review, location: @product)
  end

  def destroy
    @review.destroy!
    flash[:notice] = 'Review destroyed!'
    respond_with(@review, location: @product)
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
