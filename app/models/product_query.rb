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

    def multi(param, product_type)
      param = param.downcase
      where("(
        LOWER(title) LIKE ?
        OR isbn like ?
        OR author LIKE ?
        OR spiritual_author LIKE ?)
        AND type LIKE ?",
        "%#{param}%",
        "%#{param}%",
        "%#{param}%",
        "%#{param}%",
        "%#{product_type}%"
      )
    end
  end
end
