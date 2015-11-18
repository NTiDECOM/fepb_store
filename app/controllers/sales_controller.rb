class SalesController < ApplicationController
  # before_action :set_sale, only: [:show, :edit, :update, :destroy]

  def show
    @sale_items = current_sale.sale_items
  end

  def add_sale_item
    product_id = params[:product_id]
    product_quantity = params[:product_quantity]

    product = Product.find(product_id)
    sale_item = SaleItem.new(product: product, product_quantity: product_quantity)
    
    puts ">>> sale_item.total_price: #{sale_item.total_price}"
    puts ">>> sale_item: #{sale_item}"
    puts ">>> sale_item.product: #{sale_item.product}"
    puts ">>> sale_item.product.title: #{sale_item.product.title}"
    puts ">>> sale_item.product_quantity: #{sale_item.product_quantity}"
    
    @sale = current_sale
    @sale_item = @sale.sale_items.new(sale_item_params)
    @sale.save
    session[:sale_id] = @sale.id
    
    if @sale.add_sale_item(sale_item)
      redirect_to controller: :products, action: :index, notice: "item(s) adicionado(s)"
    else
      render action: :index, notice: "Could not add this item"
    end
  end

  def create
    @sale.create
  end

  def remove_item(sale_item)
    if @sale.items.delete(sale_item)
      redirect_to @sale, notice: "Item removido com sucesso"
    else
      render action: :index, notice: "Could not delete this item"
    end
  end

  def destroy
    @sale = current_sale
    @sale.update(sale_status: SaleStatus.find(4))
    current_sale = nil
    session[:sale_id] = nil
    redirect_to sale_path
  end

  def finalize
    @sale = current_sale
    @sale.update(sale_status: SaleStatus.find(2))
    current_sale = nil
    session[:sale_id] = nil
    redirect_to root_path, notice: 'Venda registrada com sucesso'
  end
end
