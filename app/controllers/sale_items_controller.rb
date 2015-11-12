class SaleItemsController < ApplicationController
  def create
    @sale = current_sale
    @sale_item = @sale.sale_items.new(sale_item_params)
    @sale.save
    session[:sale_id] = @sale.id
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
