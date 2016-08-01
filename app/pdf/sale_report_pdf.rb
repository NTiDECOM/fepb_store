class SaleReportPdf < Prawn::Document

  def initialize(sales_history, view)
    super()
    @sales_history = sales_history
    @view = view
    logo
    move_down 20
    text "Relatório de Vendas - Livraria FEPB", :align => :center
    sale_details
    sales_amount
  end

  def logo
    logopath = "#{Rails.root}/app/assets/images/fepb.png"
    image logopath, :width => 100, :height => 63, :position => :center
  end

  def sale_details
    move_down 40
    table sale_items_rows, :width => 550 do
      row(0).font_style = :bold
      columns(1..3).align = :right
      self.header = true
      self.column_widths = {0 => 90, 1 => 50, 2 => 220, 3 => 120, 4 => 70}
    end
  end

  def sales_amount
    move_down 30
    amount = 0
    @sales_history.each do |sale|
      amount += sale.total
    end
    text "Total: R$ #{amount}", :size => 18
  end

  def sale_items_rows
    [["Vendedor", "Qtde", "Itens", "Total", "Data"]] +
    @sales_history.map do |sale|
      [
        "#{sale.seller_name}",
        "#{precision(sale.sale_items.length)}",
        "#{detail_items(sale)}",
        "R$ #{sale.total}",
        "#{sale.updated_at.strftime('%d/%m/%Y')}"
      ]
    end
  end

  def detail_items(sale)
    items = sale.sale_items
    details_string = ""
    items.each do |item|
      details_string += (item.product.title + "\n")
    end
    return details_string
  end

  def precision(num)
    @view.number_with_precision(num, :precision => 2)
  end

end
