class DvdsController < ApplicationController
	before_action :set_dvd, only: [:show, :edit, :update, :destroy]

	def index
      #@dvds = Dvd.all
      @dvds = Dvd.order(:id).page(params[:page])
	end

	def new
      @dvd = Dvd.new
	end

	def show
	end

  def create
    @dvd = Dvd.new(dvd_params)

    if @dvd.save
      redirect_to @dvd, notice: "Dvd created successfully"
    else
    	render action: :new, notice: "Could not update this dvd"
    end
	end

	def edit
	end

	def update
	  if @dvd.update(dvd_params)
	  	redirect_to @dvd, notice: "Dvd updated successfully"
	  else
        redirect_to @dvd, notice: "Could not update this dvd"
	  end
	end

	def destroy
      if @dvd.destroy
	    redirect_to @dvd, notice: "Dvd removed successfully"
	  else
	  	redirect_to @dvd, notice: "Dvd could not be removed"
	  end
	end

  ##### helper methods #####
  private

	def dvd_params
    params.require(:dvd).
    permit(
      :title,
      :buy_price,
      :sell_price,
      :year,
      :product_image,
      :quantity
    )
	end

	def set_dvd
	  @dvd = Dvd.find(params[:id])
	end
end
