class RemoveSaleStatusFromSales < ActiveRecord::Migration
  def change
  	remove_reference :sales, :sale_status, index: true
  end
end
