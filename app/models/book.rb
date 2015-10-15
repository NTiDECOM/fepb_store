class Book < Product
  validates_presence_of :title, :author, :spiritual_author, :sell_price
end
