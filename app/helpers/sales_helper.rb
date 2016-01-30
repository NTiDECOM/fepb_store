module SalesHelper
  def cancel_before_end_session
    sale = Sale.find(session[:sale_id])
    sale.update(status: :canceled)
    current_sale = nil
  end
end
