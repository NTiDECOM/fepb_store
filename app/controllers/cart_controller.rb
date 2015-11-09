class CartController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  def index
      #@carts = Cart.all
      # @carts = Cart.order(:id).page(params[:page])
  end

  def new
  end

  def show
  end 

  # def create
  #   @cart = Cart.new(cart_params)

  #   if @cart.save
  #     redirect_to @cart, notice: "Cart created successfully"
  #   else
  #     render action: :new, notice: "Could not update this cart"
  #   end
  # end

  # def edit
  # end

  # def update
  #   if @cart.update(cart_params)
  #     redirect_to @cart, notice: "Cart updated successfully"
  #   else
  #     redirect_to @cart, notice: "Could not update this cart"
  #   end
  # end

  # def destroy
  #   if @cart.destroy
  #       redirect_to @cart, notice: "Cart removed successfully"
  #   else
  #     redirect_to @cart, notice: "Cart could not be removed"
  #   end
  # end

  def add_item(sale_item)
    initialize if @cart == nil  
    
    if @cart.items << sale_item
      redirect_to @cart, notice: "Item removido com sucesso"
    else
      render action: :new, notice: "Could not delete this item"
    end
  end

  def remove_item(sale_item)
    if @cart.items.delete(sale_item)
      redirect_to @cart, notice: "Item removido com sucesso"
    else
      render action: :new, notice: "Could not delete this item"
    end
  end

  ##### helper methods #####
  private

  def initialize
    @cart = Cart.new
  end

  def cart_params
    params.require(:cart).permit()
  end
end
