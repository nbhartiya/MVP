class ApplicationController < ActionController::Base
  #protect_from_forgery
  before_filter :authenticate_user!, :track_stuff
  helper_method :completed_user?

  def authenticate_admin_user!
    if current_user.id==1 || current_user.id==13
    else
      raise SecurityError
    end
  end

  def after_sign_out_path_for(resource)
    home_index_path
  end
  #use cookie to determine after sign in path!
  def after_sign_in_path_for(resource)
    if current_user.profile == nil
      current_user.profile=Profile.new
    end
    if current_user.chef == false
      if cookies[:after_sign_in_path_foodie].present?
        path = cookies[:after_sign_in_path_foodie]
        cookies[:after_sign_in_path_foodie] = nil
        cookies[:after_sign_in_path_biz] = nil
        path.to_s
      else
        events_path
      end
    else
      if cookies[:after_sign_in_path_biz].present?
        path = cookies[:after_sign_in_path_biz]
        cookies[:after_sign_in_path_foodie] = nil
        cookies[:after_sign_in_path_biz] = nil
        path.to_s
      else
        "/edit_my_profile"
      end
    end
  end

  def track_stuff
    if user_signed_in?
      Analytics.identify(
        user_id: current_user.id,
        traits: { email: current_user.email, first_name: current_user.first_name, last_name: current_user.last_name, chef: current_user.chef }
        )
    else
      Analytics.identify(
        user_id: 'anonymous_user')
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
