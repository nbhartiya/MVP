class ApplicationController < ActionController::Base
  #protect_from_forgery
  before_filter :authenticate_user!
  helper_method :completed_user?

  def after_sign_out_path_for(resource)
    events_path
  end

  def after_sign_in_path_for(resource)
    if current_user.profile == nil
      current_user.profile=Profile.new
    end
    if current_user.chef == false
      events_path
    else
      edit_profile_path(current_user.profile)
    end
  end
  
  #not necessary now, but if we want logout to go somewhere in particular...
  #def after_sign_out_path_for(resource)
  #  home_index_path
  #end
  
  def completed_user?
    if !current_user.email == nil
      current_user.completed = 'true'
    end
    #redirect_to "/users/#{current_user.id}/edit" if !current_user.completed
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to events_url, :notice => "You cannot edit an event or campaign you have not created."
    #TODO Why doesn't this notice work?
  end
  
end
