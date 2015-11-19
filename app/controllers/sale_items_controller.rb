class SaleItemsController < ApplicationController
  def new
    @sale_item = SaleItem.new
  end

  def create    
    @sale = current_sale
    @sale_item = @sale.sale_items.new(sale_item_params)

    if @sale.id.present?
      sale_items = SaleItem.joins(:sale).where({sale_id: @sale.id, product_id: @sale_item.product_id, 'sales.sale_status_id' => 1})
      @sale_item = sale_items[0]
      new_product_quantity = @sale_item.product_quantity.to_i + sale_item_params[:product_quantity].to_i
      @sale_item.update(product_quantity: new_product_quantity)
    else
      @sale.user = current_user
      @sale.buyer_name = current_user.name
      @sale.total = @sale.total_price
      @sale.save
      session[:sale_id] = @sale.id
    end   
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
