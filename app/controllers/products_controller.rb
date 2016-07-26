class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @selected_product_type = params[:product_type]

    if params[:search_param]
      @products = ProductQuery.new.search.multi(params[:search_param], @selected_product_type).order(:title).page(params[:page])
    else
      @products = Product.order(:title).page(params[:page])
    end

    @sale_item = current_sale.sale_items.new
  end

  def new
      @product = Product.new
  end

  def show
  end

  def create
    # @product = Product.new(product_params)
    #
    # if @product.save
    #   redirect_to @product, notice: "Product created successfully"
    # else
    #   render action: :new, notice: "Could not save this product"
    # end
  end

  def edit
  end

  def update
    # if @product.update(product_params)
    #   redirect_to @product, notice: "Product updated successfully"
    # else
    #   redirect_to @product, notice: "Could not update this product"
    # end
  end

  def destroy
    if @product.destroy
      redirect_to @product, notice: "Product removed successfully"
    else
      redirect_to @product, notice: "Product could not be removed"
    end
  end

  def inventory
    @products = Product.order(:id).page(params[:page])
  end

  ##### helper methods #####
  private

  # def product_params
  #   params.require(:product).
  #   permit(:title, :buy_price, :sell_price, :product_image, :quantity)
  # end

  def set_product
    @product = Product.find(params[:id])
  end
end
