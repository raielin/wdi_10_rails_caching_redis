class ProductsController < ApplicationController
  respond_to :html, :json
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
    respond_with(@products)
  end

  def show
    respond_with(@product)
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Product created!'
    end
    respond_with(@product)
  end

  def update
    if @product.update(product_params)
      flash[:notice] = 'Product updated!'
    end
    respond_with(@product)
  end

  def destroy
    @product.destroy!
    flash[:notice] = 'Product destroyed!'
    respond_with(@product)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
