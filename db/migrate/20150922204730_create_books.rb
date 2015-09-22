class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.string :author
      t.string :spiritual_author
      t.string :publisher
      t.decimal :cost
      t.decimal :price
      t.integer :year
      t.integer :pages_number

      t.timestamps null: false
    end
  end
end
