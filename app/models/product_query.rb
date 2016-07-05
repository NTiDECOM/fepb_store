class ProductQuery
  def initialize(relation = Product.all)
    @relation = relation.extending(Scopes)
  end

  def search
    @relation
  end

  module Scopes
    def by_title(title)
      where("LOWER(title) LIKE ?", "%#{title.downcase}%")
    end
  end
end
