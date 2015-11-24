class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :require_admin, only: [:edit, :destroy]
  # after_filter :flash_to_headers

  helper_method :current_sale

  def require_admin
    if !current_user.present?
      redirect_to new_user_session_path, alert: t('errors.messages.permission')
    elsif current_user.present? and !current_user.admin
      redirect_to new_user_session_path, alert: t('errors.messages.permission')
    end
  end

  def current_sale
    if session[:sale_id].present?
      Sale.find(session[:sale_id])
    else
      Sale.new
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email) }

    devise_parameter_sanitizer.for(:sign_up) {
      |u| u.permit(
        :name, :surname, 
        :email, 
        :password, :password_confirmation,
        :admin
      )
    }

    devise_parameter_sanitizer.for(:account_update) {
      |u| u.permit(
        :name, :surname, 
        :cpf, 
        :phone1, :phone2, 
        :city, :state, :cep, 
        :street, :street_number, :street_complement,
        :admin
      )
    }     
  end

  private

  def flash_to_headers
    return unless request.xhr?
    response.headers['X-Message'] = flash_message
    response.headers["X-Message-Type"] = flash_type.to_s

    flash.discard # don't want the flash to appear when you reload page
  end
end