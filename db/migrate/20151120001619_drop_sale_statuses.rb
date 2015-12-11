class DropSaleStatuses < ActiveRecord::Migration
  def change
  	drop_table :sale_statuses
  end
end
