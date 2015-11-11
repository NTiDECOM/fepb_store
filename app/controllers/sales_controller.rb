class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # def initialize
  #   @sale = Sale.new if @sale == nil
  # end

  def show
    @sale_items = current_sale.sale_items
  end

  def add_item
    product_id = params[:id]
    quantity = params[:quant]

    product = Product.find(product_id)
    sale_item = SaleItem.new(product, quantity)

    puts ">>> sale_item.product: #{sale_item.product.title}"
    puts ">>> sale_item.quantity: #{sale_item.quantity}"

    sale = Sale.new
    
    if sale.add_sale_item(sale_item)
      redirect_to action: :index, notice: "#{quantity} item adicionado"
    else
      render action: :index, notice: "Could not add this item"
    end
  end

  def remove_item(sale_item)
    if @sale.items.delete(sale_item)
      redirect_to @sale, notice: "Item removido com sucesso"
    else
      render action: :index, notice: "Could not delete this item"
    end
  end
end
