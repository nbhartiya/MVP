class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  helper_method :completed_user?
  
  def after_sign_in_path_for(resource)
    survey_path
  end
  
  #not necessary now, but if we want logout to go somewhere in particular...
  #def after_sign_out_path_for(resource)
  #  home_index_path
  #end
  
  def completed_user?
    if !current_user.kind == nil
      current_user.completed = 'true'
    end
    redirect_to "/users/#{current_user.id}/edit" if !current_user.completed
  end
  
end
