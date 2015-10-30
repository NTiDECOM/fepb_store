class TicketsController < ApplicationController
	before_action :set_ticket, only: [:show, :edit, :update, :destroy]

	def index
      #@tickets = Ticket.all
      @tickets = Ticket.order(:id).page(params[:page])
	end

	def new
      @ticket = Ticket.new
	end

	def show
	end	

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to @ticket, notice: "Ticket created successfully"
    else
    	render action: :new, notice: "Could not update this ticket"
    end
	end

	def edit       
	end

	def update
	  if @ticket.update(ticket_params)
	  	redirect_to @ticket, notice: "Ticket updated successfully"
	  else
        redirect_to @ticket, notice: "Could not update this ticket"
	  end
	end

	def destroy
      if @ticket.destroy
	    redirect_to @ticket, notice: "Ticket removed successfully"
	  else
	  	redirect_to @ticket, notice: "Ticket could not be removed"
	  end
	end

  ##### helper methods #####
  private

	def ticket_params
    params.require(:ticket).
    permit(:isbn, :title, :author, :spiritual_author, :publisher, :buy_price, :sell_price, :year, :pages_number, :product_image)
	end

	def set_ticket
	  @ticket = Ticket.find(params[:id])
	end
end
