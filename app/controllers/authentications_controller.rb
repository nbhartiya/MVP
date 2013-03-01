class AuthenticationsController < Devise::OmniauthCallbacksController
  
  def provider
    omni = request.env["omniauth.auth"]
    raise omni
  end
  
  alias_method :twitter, :provider
  alias_method :linkedin, :provider
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
