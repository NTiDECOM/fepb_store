class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :type
      t.string :title
      t.decimal :buy_price
      t.decimal :sell_price

      t.string :isbn
      t.string :author
      t.string :spiritual_author
      t.string :publisher
      t.integer :year
      t.integer :pages_number
      t.text :synopisis

      t.date :event_day
      t.datetime :event_time

      t.timestamps null: false
    end
  end
end
