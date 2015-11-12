class SaleItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :sale

  validates :product_quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :sale_present  

  def total_price
    product.sell_price * product_quantity
  end

  private

  def product_present
    if product.nil?
      errors.add(:product, "is not valid or is not active.")
    end
  end

  def sale_present
    if sale.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = product_quantity * self[:product_price]
  end
end
