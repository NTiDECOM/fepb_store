class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
    @users = User.order(:name).page(params[:page])
  end

  def new
    @user = User.new
  end

  def show
  end 

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.acc_created(@user).deliver_now
      redirect_to users_path, notice: "Usuário criado com sucesso"
    else
      render action: :new, notice: "Não foi possível criar esta usuário"
    end
  end

  def edit
  end

  def update
    if @user.password.nil? && @user.password_confirmation.present?
      redirect to @user, notice: t('warning.password_is_mandatory')
    elsif @user.password.present? && @user.password_confirmation.nil?
      redirect to @user, notice: t('warning.password_confirmation_is_mandatory')
    elsif (@user.password.eql? @user.password_confirmation) == false
      redirect to @user, notice: t('warning.passwords_must_match')
    else
      if @user.update(user_params)      
        redirect_to @user, notice: "Usuário atualizado com sucesso"
      else
        redirect_to @user, notice: "Não foi possível atualizar esta usuário"
      end
    end
  end

  def destroy
    if @user.destroy
      redirect_to @users, notice: "Usuário removido com sucesso"
    else
      redirect_to @users, notice: "Não é possível remover este usuário"
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
      :admin, 
      :password, 
      :password_confirmation
    )
  end

  def set_user
    # if current_user
    #   @user = current_user 
    # else
    #   @user = User.find(params[:id])
    # end
    @user = User.find(params[:id])
  end

  def validate_admin
    redirect_to new_user_session_path, alert: t('errors.messages.permission') if !current_user or current_user.admin == false
  end
end