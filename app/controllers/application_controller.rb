class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #####################
  # devise sign out path
  #####################
  def after_sign_out_path_for resource
    root_path
  end 
 
  #####################
  # devise sign in path
  #####################
  def after_sign_in_path_for(resource) 
    admin_index_path
  end
end
