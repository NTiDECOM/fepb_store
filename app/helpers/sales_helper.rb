module SalesHelper
  def cancel_sale_before_end_session
    if session[:sale_id].present?
      sale = Sale.find(session[:sale_id])
      sale.update(status: :canceled)
      current_sale = nil
    end
  end
  def items_to_list(items)
    item_list = ""
    items.each do |item|
      begin
        item_list += (item.product.title + "<br />")
      rescue
        item_list += "Indefinido".html_safe
      end
    end
    return item_list
  end
end
