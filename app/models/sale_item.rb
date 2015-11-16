class SaleItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :sale

  validates :product_quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :sale_present

  before_save :finalize
  
  def total_price
    self.product.sell_price * self.product_quantity
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
    " >>> FINALIZEEEEEEEEEEEEEEEEEEEE <<<<<<<<<<<<<<<<"
    self[:unit_price] = unit_price
    self[:total_price] = self.product_quantity * self[:product_price]
  end
end
