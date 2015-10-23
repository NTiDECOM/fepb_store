class Product < ActiveRecord::Base
  # attr_accessor :title, :author, :product_image, :product_image_url
	validates_presence_of :title, :sell_price
  mount_uploader :product_image, ProductImageUploader # Tells rails to use this uploader for this model.

end