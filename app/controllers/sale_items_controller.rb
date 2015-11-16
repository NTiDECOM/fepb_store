class SaleItemsController < ApplicationController
  def new
    @sale_item = SaleItem.new
  end

  def create
    @sale = current_sale
    # @sale_item = @sale.sale_items.new
    @sale_item = @sale.sale_items.new(sale_item_params)

    # @sale.sale_items.each do |item|
    #   if item.product.present? and item.product.id.to_i == sale_item_params[:product_id].to_i
    #     puts " >>> if"
    #     puts " >>> item: #{item}"
    #     new_quantity = item.product_quantity + sale_item_params[:product_quantity].to_i
    #     @sale_item = @sale.sale_items.update(item.id, product_quantity: new_quantity)
    #   else
    #     puts " >>> else"
    #     @sale_item = @sale.sale_items.new(sale_item_params)
    #   end
    # end

    # puts " >>> @sale_item.errors: #{@sale_item.errors.full_messages}"
    # puts " >>> @sale.sale_items.size: #{@sale.sale_items.size}"

    @sale.save
    session[:sale_id] = @sale.id

    # puts " >>> @sale_item type: #{@sale.sale_items.class.name}"
    # puts " >>> @sale_item product: #{@sale.sale_items.product}"
    # puts " >>> @sale_item: #{@sale_item}"
    # puts " >>> @sale_item_params: #{sale_item_params}"
    # puts " >>> @sale_item_params[:product_quantity]: #{sale_item_params[:product_quantity]}"
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
