class Sale < ActiveRecord::Base
  has_many :sale_items, dependent: :destroy
  belongs_to :user

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end
end
