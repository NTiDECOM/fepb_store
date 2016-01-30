module SalesHelper
  def cancel_before_end_session
    puts ">>> chamou saleshelper"
    sale = Sale.find(session[:sale_id])
    puts ">>> sale: #{sale.total}"
    sale.update(status: :canceled)
    current_sale = nil
  end
end
