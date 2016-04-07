class SaleItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :sale

  validates :product_quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :sale_present

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.sell_price
    end
  end
  
  def total_price
    unit_price * product_quantity
  end

  private

  def product_present
    errors.add(:product, "is not valid or is not active.") if product.nil?
  end

  def sale_present
    errors.add(:order, "is not a valid order.") if sale.nil?
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = product_quantity * self[:unit_price]
  end
end
