class TicketsController < ApplicationController
	before_action :set_ticket, only: [:show, :edit, :update, :destroy]

	def index
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
      redirect_to @ticket, notice: "Ingresso criado com suscesso"
    else
    	render action: :new, notice: "Não foi possível criar o ingresso"
    end
	end

	def edit
	end

	def update
		@ticket.event_datetime = DateTime.parse(ticket_params[:event_datetime])
		
	  if @ticket.update(ticket_params)
	  	redirect_to @ticket, notice: "Ingresso atualizado com sucesso"
	  else
      redirect_to @ticket, notice: "Não foi possível atualizar as informações deste ingreeo"
	  end
	end

	def destroy
      if @ticket.destroy
	    redirect_to @ticket, notice: "Ingresso removi com sucesso"
	  else
	  	redirect_to @ticket, notice: "Não foi possível remover o ingresso"
	  end
	end

  ##### helper methods #####
  private

	def ticket_params
    params.require(:ticket).permit(
		  :title,
			:buy_price,
			:sell_price,
			:product_image,
			:event_datetime,
			:quantity
		)
	end

	def set_ticket
	  @ticket = Ticket.find(params[:id])
	end
end
