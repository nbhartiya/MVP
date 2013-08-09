class AuthenticationsController < Devise::OmniauthCallbacksController

  def provider
    omni = request.env["omniauth.auth"]
    #raise omni.to_yaml
    authentication = Authentication.find_by_provider_and_uid(omni['provider'], omni['uid'])
    if authentication
      flash[:notice] = "Logged in Successfully"
      sign_in_and_redirect User.find(authentication.user_id)
    elsif current_user
      current_user.authentications.create!(:provider => omni['provider'], :uid => omni['uid'], :token => omni['credentials']['token'])
      flash[:notice] = "We successfully connected your social account!"
      sign_in_and_redirect current_user
    else
      user_type = cookies[:chef]
      user = User.new
      user.apply_omniauth(omni, user_type)
      if user.save
        flash[:notice] = "You're all signed up!"
        #Notifier.signup_email(user).deliver
        # make this go to edit
        user.profile=Profile.new
        sign_in User.find(user.id)
        if user.chef?
          redirect_to edit_profile_path(current_user.profile)
        else
          redirect_to events_path
        end
      else
        session["omni"] = omni.except("extra")
        session["devise.user_attributes"] = user.attributes
        redirect_to new_user_registration_path
      end
    end
  end
  
  alias_method :twitter, :provider
  # alias_method :linkedin, :provider
  alias_method :facebook, :provider
  
  def index
    @authentications = Authentication.all
  end

  def create
    #@authentication = Authentication.new(params[:authentication])
    #if @authentication.save
    #  redirect_to authentications_url, :notice => "Successfully created authentication."
    #else
    #  render :action => 'new'
    #end
  end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end

end
