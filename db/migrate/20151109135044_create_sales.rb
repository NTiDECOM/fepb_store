class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :user, index: true, foreign_key: true
      t.string :buyer_name
      t.decimal :subtotal, precision: 12, scale: 3
      t.decimal :total, precision: 12, scale: 3
      
      t.timestamps null: false
    end
  end
end
