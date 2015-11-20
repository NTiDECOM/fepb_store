class Sale < ActiveRecord::Base
  has_many :sale_items
  belongs_to :user
  before_create :set_status

  enum status: [:in_progress, :finalized, :canceled]

  def total_price
    self.sale_items.collect { |sale_item| 
      sale_item.valid? ? (sale_item.product_quantity * sale_item.product.sell_price) : 0 
    }.sum
  end

  def add_sale_item(sale_item)
    self.sale_items << sale_item
    self.sale_items.each do |item|
      puts "#{item.product.title} - #{item.product_quantity}"
    end
  end

  private

  def update_subtotal
    self[:subtotal] = subtotal
  end

  def set_status
    self.status = :in_progress
  end
end