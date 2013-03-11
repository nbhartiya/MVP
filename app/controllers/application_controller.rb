class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  helper_method :completed_user?
  
  def after_sign_in_path_for(resource)
    survey_path
  end
  
  def completed_user?    
    redirect_to "/users/#{current_user.id}/edit" if !current_user.completed
  end
  
end
