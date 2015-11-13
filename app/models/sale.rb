class Sale < ActiveRecord::Base
  has_many :sale_items
  belongs_to :user

  def total_price
    sale_items.collect { |sale_item| 
      sale_item.valid? ? (sale_item.product_quantity * sale_item.product.sell_price) : 0 
    }.sum
  end  

  def add_sale_item(sale_item)
    sale_items << sale_item
  end

  private

  def update_subtotal
    self[:subtotal] = subtotal
  end
end