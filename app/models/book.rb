class Book < Product
  validates_presence_of :title, :author, :spiritual_author, :sell_price

  def default_image_path
    "book.png"
  end
end
