class Book < ActiveRecord::Base
  validates_presence_of :title, :author, :spiritual_author, :price
end
