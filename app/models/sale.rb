class Sale < ActiveRecord::Base
  has_many :sale_items, dependent: :destroy
  belongs_to :user

  def subtotal
    sale_items.collect(&calculate_sale_total_price).sum
  end

  calculate_sale_item_total_price = Proc.new do |sale_item|
    sale_item.valid? ? (sale_item.product_quantity * sale_item.price) : 0 
  end

  def add_sale_item(sale_item)
    sale_items << sale_item
  end

  private

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
