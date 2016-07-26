class AddSellerNameToSale < ActiveRecord::Migration
  def change
    add_column :sales, :seller_name, :string
  end
end
