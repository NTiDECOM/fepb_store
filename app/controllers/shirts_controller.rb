class ShirtsController < ApplicationController
	before_action :set_shirt, only: [:show, :edit, :update, :destroy]

	def index
      #@shirts = Shirt.all
      @shirts = Shirt.order(:id).page(params[:page])
	end

	def new
      @shirt = Shirt.new
	end

	def show
	end

  def create
    @shirt = Shirt.new(shirt_params)

    if @shirt.save
      redirect_to @shirt, notice: "Shirt created successfully"
    else
    	render action: :new, notice: "Could not update this shirt"
    end
	end

	def edit
	end

	def update
	  if @shirt.update(shirt_params)
	  	redirect_to @shirt, notice: "Shirt updated successfully"
	  else
        redirect_to @shirt, notice: "Could not update this shirt"
	  end
	end

	def destroy
      if @shirt.destroy
	    redirect_to @shirt, notice: "Shirt removed successfully"
	  else
	  	redirect_to @shirt, notice: "Shirt could not be removed"
	  end
	end

  ##### helper methods #####
  private

	def shirt_params
    params.require(:shirt).
    permit(
      :title,
      :buy_price,
      :sell_price,
      :product_image,
      :quantity
    )
	end

	def set_shirt
	  @shirt = Shirt.find(params[:id])
	end
end
