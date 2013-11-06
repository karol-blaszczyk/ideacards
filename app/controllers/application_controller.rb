require "app_responder"

class ApplicationController < ActionController::Base
  protect_from_forgery
  self.responder = AppResponder  
  respond_to :html  

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end


  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit! }
  end  


  # If helps building an element if there is and ID of it (will try to
  # find it based on that ID)
  # If there is no params[:id] it will create a new instance of given class
  # @param klass [ActiveRecord::Base] ActiveRecord class type
  # @param attr [Symbol] from which params[attr] it should take attributes to
  #   build a new instance
  # @param find_method [Symbol] what method it should use to find an element
  # @return [ActiveRecord::Base] your activerecord class instance
  # @example
  #   @element = build_resource(Menu, :menu, :find_by_name!)
  def build_resource(klass, attr = :attr, find_method = :find)
    if params[:id]
      klass.send(find_method, params[:id])
    else
      klass.new(params[attr])
    end
  end


end
