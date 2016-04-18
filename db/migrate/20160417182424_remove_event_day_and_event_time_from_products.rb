class RemoveEventDayAndEventTimeFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :event_day, :date
    remove_column :products, :event_time, :datetime
  end
end
