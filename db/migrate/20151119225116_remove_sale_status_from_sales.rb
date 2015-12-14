class RemoveSaleStatusFromSales < ActiveRecord::Migration
  def change
    remove_foreign_key :sales, column: :sale_status_id
    remove_reference :sales, :sale_status, index: true
  end
end