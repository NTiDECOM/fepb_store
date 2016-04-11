class SaleItemsController < ApplicationController
  def new
    @sale_item = SaleItem.new
  end

  def create
    @sale = current_sale

    if @sale.id.present?
      sale_items = SaleItemQuery.new.search.sale_in_progress(@sale.id, sale_item_params[:product_id])
      @sale_item = sale_items.first

      if @sale_item.present?
        new_product_quantity = @sale_item.product_quantity.to_i + sale_item_params[:product_quantity].to_i
        @sale_item.update(product_quantity: new_product_quantity)
      else
        @sale_item = @sale.sale_items.new(sale_item_params)
        @sale.update(total: @sale.total_price)
      end
    else
      @sale_item = @sale.sale_items.new(sale_item_params)
      @sale.user = current_user
      @sale.total = @sale.total_price
      @sale.status = :in_progress
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
    @sale.status = :canceled
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
