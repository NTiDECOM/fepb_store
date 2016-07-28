class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :require_admin, only: [:edit, :destroy]

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
      # UserMailer.acc_created(@user).deliver_now
      redirect_to users_path, notice: "Usuário criado com sucesso"
    else
      render action: :new, notice: "Não foi possível criar esta usuário"
    end
  end

  def edit
  end

  def update
    # if @user.password.present? && @user.password_confirmation.present?
    #   redirect to @user, notice: t('warning.password_is_mandatory')
    # elsif @user.password.present? && @user.password_confirmation.present?
    #   redirect to @user, notice: t('warning.password_confirmation_is_mandatory')
    # elsif (@user.password.eql? @user.password_confirmation) == false
    #   redirect to @user, notice: t('warning.passwords_must_match')
    # else
    if @user.update(user_params)
      redirect_to @user, notice: "Usuário atualizado com sucesso"
    else
      redirect_to @user, notice: "Não foi possível atualizar este usuário #{@user.errors.full_messages}"
    end
    # end
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
      :state,
      :city,
      :neighborhood,
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
    @user = User.find(params[:id])
  end
end
