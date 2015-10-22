class UsersController < ApplicationController
	def index
      #@users = User.all
      @users = User.order(:name).page(params[:page]).per(5)
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
    if @user.update(User_params)
      redirect_to @user, notice: "User updated successfully"
    else
        redirect_to @user, notice: "Could not update this User"
    end
  end

  def destroy
      if @user.destroy
      redirect_to :Users_path, notice: "User removed successfully"
    else
      redirect_to :Users_path, notice: "User could not be removed"
    end
  end

  ##### helper methods #####
  private

  def User_params
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
      )
  end

  def set_User
    @user = User.find(params[:id])
  end
end