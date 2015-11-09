class Cart < ActiveRecord::Base
  has_many :sale_items
end