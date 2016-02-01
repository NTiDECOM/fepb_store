module SalesHelper
  def cancel_sale_before_end_session    
    if session[:sale_id].present?
      sale = Sale.find(session[:sale_id])
      sale.update(status: :canceled)
      current_sale = nil
    end
  end
end
