class SaleItem < ActiveRecord::Base
  has_many :products
  belongs_to :sale

  validates :product_quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :sale_present

  private

  def product_present
    if product.nil?
      errors.add(:product, "is not valid or is not active.")
    end
  end

  def sale_present
    if order.nil?
      errors.add(:order, "is not a valid order.")
    end
  end

  def finalize
    self[:unit_price] = product.price
    self[:total_price] = quantity * self[:unit_price]
  end
end
