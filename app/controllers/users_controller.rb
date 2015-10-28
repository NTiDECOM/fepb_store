class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
      #@users = User.all
      @users = User.order(:name).page(params[:page])
  end

  def new
      @user = User.new
  end

  def show
  end 

  def create
    if @user.save
      redirect_to @user, notice: "User created successfully"
    else
      render action: :new, notice: "Could not update this User"
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User updated successfully"
    else
        redirect_to @user, notice: "Could not update this User"
    end
  end

  def destroy
    if @user.destroy
      redirect_to :users_path, notice: "User removed successfully"
    else
      redirect_to :users_path, notice: "User could not be removed"
    end
  end

  ##### helper methods #####
  private

  def user_params
    params.require(:user).permit(
      :name, 
      :surname, 
      :email, 
      :cpf, 
      :phone1,
      :phone2,
      :city, 
      :state,         
      :cep,
      :street, 
      :street_number, 
      :street_complement,
      :avatar,
      :admin
    )
  end

  def set_user
    if current_user
      @user = current_user 
    else
      @user = User.find(params[:id])
    end
  end
end