class CreateSaleItems < ActiveRecord::Migration
  def change
    create_table :sale_items do |t|
      t.references :sale, index: true, foreign_key: true
      t.integer :product_quantity
      t.decimal :price
      t.string :product_name

      t.timestamps null: false
    end
  end
end
