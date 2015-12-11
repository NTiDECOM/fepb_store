class AddStatusToSalesNoReference < ActiveRecord::Migration
  def change
    add_column :sales, :status, :integer, default: 0
  end
end
