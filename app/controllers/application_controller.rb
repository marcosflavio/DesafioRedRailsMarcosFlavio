class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #chamando o método de segurança antes que o devise_controller seja chamado
  before_action :configurar_parametros_de_seguranca, if: :devise_controller?
  
  #Este método protege o banco de dados contra insercao de dados nao permitidos
  protected
  def configurar_parametros_de_seguranca
   
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:status,:image,:username, :email, :password, :password_confirmation, :current_password) }
   
  end
end
