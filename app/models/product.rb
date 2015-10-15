class Product < ActiveRecord::Base
	validates_presence_of :title, :sell_price
end