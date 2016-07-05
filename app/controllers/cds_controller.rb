class CdsController < ApplicationController
  before_action :set_cd, only: [:show, :edit, :update, :destroy]

  def index
      #@cds = Cd.all
      @cds = Cd.order(:id).page(params[:page])
  end

  def new
      @cd = Cd.new
  end

  def show
  end

  def create
    @cd = Cd.new(cd_params)

    if @cd.save
      redirect_to @cd, notice: "Cd created successfully"
    else
      render action: :new, notice: "Could not update this cd"
    end
  end

  def edit
  end

  def update
    if @cd.update(cd_params)
      redirect_to @cd, notice: "Cd updated successfully"
    else
        redirect_to @cd, notice: "Could not update this cd"
    end
  end

  def destroy
      if @cd.destroy
      redirect_to @cd, notice: "Cd removed successfully"
    else
      redirect_to @cd, notice: "Cd could not be removed"
    end
  end

  ##### helper methods #####
  private

  def cd_params
    params.require(:cd).
    permit(
      :isbn,
      :title,
      :publisher,
      :buy_price,
      :sell_price,
      :year,
      :product_image,
      :quantity
    )
  end

  def set_cd
    @cd = Cd.find(params[:id])
  end
end
