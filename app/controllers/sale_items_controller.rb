class SaleItemsController < ApplicationController
  def new
    @sale_item = SaleItem.new
  end

  def create    
    @sale = current_sale
    @sale_item = @sale.sale_items.new(sale_item_params)
    @sale.user = current_user
    @sale.buyer_name = current_user.name
    @sale.total = @sale.total_price
    @sale.save
    session[:sale_id] = @sale.id
  end

  def update
    @sale = current_sale
    @sale_item = @sale.sale_items.find(params[:id])
    @sale_item.update_attributes(sale_item_params)
    @sale.update(total: @sale.total_price)
    @sale_items = @sale.sale_items
  end

  def destroy
    @sale = current_sale
    @sale_item = @sale.sale_items.find(params[:id])
    @sale_item.destroy
    @sale_items = @sale.sale_items
    redirect_to @sale
  end

  private

  def sale_item_params
    params.require(:sale_item).permit(:product_quantity, :product_id)
  end
end
