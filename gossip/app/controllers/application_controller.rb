class ApplicationController < ActionController::Base

  #Authorise le rajout des autres champs de l'enregistrement

  before_action :configure_devise_parameters, if: :devise_controller?

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :description, :is_alive, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :description, :is_alive, :email, :password, :password_confirmation)}
  end

end
