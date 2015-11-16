class CreateSaleItems < ActiveRecord::Migration
  def change
    create_table :sale_items do |t|
      t.references :sale, index: true
      t.references :product, index: true
      t.integer :product_quantity
      t.decimal :unit_price, precision: 12, scale: 3
      t.decimal :total_price, precision: 12, scale: 3

      t.timestamps null: false
    end
  end
end
