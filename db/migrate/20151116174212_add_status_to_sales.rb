class AddStatusToSales < ActiveRecord::Migration
  def change
    add_reference :sales, :sale_status, index: true, foreign_key: true
  end
end
