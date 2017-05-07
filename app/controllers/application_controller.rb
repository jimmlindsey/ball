class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  before_action :store_current_location, :unless => :devise_controller?, except: [:upvote, :downvote]
  
  def store_current_location
    store_location_for(:user, request.url)
  end
  
  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :remember_me]
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :fullname, :username, :instagram, :player, :location, :description, :position, :avatar])
  end
end
