class Sale < ActiveRecord::Base
  has_many :sale_items
  belongs_to :user
  belongs_to :sale_status
  before_create :set_sale_status

  enum status: [in_progress: 0, finalized: 1, canceled: 2]

  def total_price
    self.sale_items.collect { |sale_item| 
      sale_item.valid? ? (sale_item.product_quantity * sale_item.product.sell_price) : 0 
    }.sum
  end

  def add_sale_item(sale_item)
    puts ">>> self.sale_items type: #{self.sale_items.class}"
    self.sale_items << sale_item
    puts ">>> self.sale_items: #{self.sale_items.length}"
    self.sale_items.each do |item|
      puts "#{item.product.title} - #{item.product_quantity}"
    end
  end

  private

  def update_subtotal
    self[:subtotal] = subtotal
  end

  def set_sale_status
    self.status = SaleStatus.name[:in_progress]
  end
end