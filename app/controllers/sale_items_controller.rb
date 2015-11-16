class SaleItemsController < ApplicationController
  def create
    @sale = current_sale

    puts " >>> current_sale: #{@sale}"

    puts " >>> @sale_item product_id: #{sale_item_params[:product_id]}"
    puts " >>> @sale_item product_quantity: #{sale_item_params[:product_quantity]}"

    @sale.sale_items.each do |item|
      puts " >>> @item: #{item.product.title}"
      puts " >>> @item product_quantity BEFORE: #{item.product_quantity}"
      if item.product.id == sale_item_params[:product_id]
        item.product_quantity = item.product_quantity + 1
      else
        @sale_item = @sale.sale_items.new(sale_item_params)
      end
      puts " >>> @item: #{item.product.title}"
      puts " >>> @item product_quantity AFTER: #{item.product_quantity}"
    end

    puts " >>> @sale_item type: #{@sale.sale_items.class.name}"
    puts " >>> @sale_item product: #{@sale.sale_items.product}"
    puts " >>> @sale_item: #{@sale_item}"
    puts " >>> @sale_item_params: #{sale_item_params}"
    puts " >>> @sale_item_params[:product_quantity]: #{sale_item_params[:product_quantity]}"
    # @sale.save
    # session[:sale_id] = @sale.id
  end

  def update
    @sale = current_sale
    @sale_item = @sale.sale_items.find(params[:id])
    @sale_item.update_attributes(sale_item_params)
    @sale_items = @sale.sale_items
  end

  def destroy
    @sale = current_sale
    @sale_item = @sale.sale_items.find(params[:id])
    @sale_item.destroy
    @sale_items = @sale.sale_items
  end

  private

  def sale_item_params
    params.require(:sale_item).permit(:product_quantity, :product_id)
  end
end
