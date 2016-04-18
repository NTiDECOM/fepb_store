class AddEventDatetimeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :event_datetime, :datetime
  end
end
