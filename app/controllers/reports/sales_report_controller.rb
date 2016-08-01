class Reports::SalesReportController < ApplicationController

  def month_report
    begining_date = DateTime.new(params[:year].to_i, params[:month].to_i)
    end_date = create_end_date(params[:year].to_i, params[:month].to_i)
    @sales = Sale.where(:updated_at => begining_date..end_date)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = SaleReportPdf.new(@sales, view_context)
        send_data pdf.render, filename: "#{Time.now.strftime('%d_%m_%Y')}_vendas-livraria.pdf", type: 'application/pdf'
      end
    end
  end

  def create_end_date(year, month)
    if month < 12
      return DateTime.new(year, month + 1)
    else
      return DateTime.new(year + 1, 1)
    end
  end

end
