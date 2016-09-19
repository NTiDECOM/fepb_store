class SalesController < ApplicationController
  # before_action :set_sale, only: [:show, :edit, :update, :destroy]
  before_action :get_sales, only: [:index, :details]

  def index
  end

  def show
    @sale_items = current_sale.sale_items
  end

  def destroy
    @sale = current_sale
    @sale.update(status: :canceled)
    current_sale = nil
    session[:sale_id] = nil
    redirect_to sale_path
  end

  def finalize
    @sale = current_sale
    @sale.update(status: :finalized, buyer_name: params[:customer_name], seller_name: current_user.full_name)
    @sale.sale_items.each do |sale_item|
      sale_item.update_product_quantity(sale_item.product_quantity)
    end
    current_sale = nil
    session[:sale_id] = nil
    redirect_to root_path, notice: t('controllers.sales.finalize_success')
  end

  def history_details
    @sale = Sale.find(params[:sale_id])
    @sale_items = @sale.sale_items
  end

  private

  def get_sales
    @sales = Sale.order(:id).page(params[:page])
  end
end
