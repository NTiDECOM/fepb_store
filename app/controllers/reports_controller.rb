class ReportsController < ApplicationController

  def books
    @books = Book.order(:title)
  end

end
