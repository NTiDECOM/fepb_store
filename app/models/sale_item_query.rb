class SaleItemQuery
  def initialize(relation = SaleItem.all)
    @relation = relation.extending(Scopes)
  end
  
  def search
    @relation
  end

  module Scopes
    def sale_in_progress(sale_id, product_id)
      joins(:sale).where({sale_id: sale_id, product_id: product_id, 'sale_id' => Sale.in_progress})
    end

    def sale_finalized(sale_id, product_id)
      joins(:sale).where({sale_id: sale_id, product_id: product_id, 'sale_id' => Sale.finalized})
    end

    def sale_canceled(sale_id, product_id)
      joins(:sale).where({sale_id: sale_id, product_id: product_id, 'sale_id' => Sale.canceled})
    end
  end
end