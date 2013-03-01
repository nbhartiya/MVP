class AuthenticationsController < Devise::OmniauthCallbacksController
  def index
    @authentications = Authentication.all
  end

  def create
    @authentication = Authentication.new(params[:authentication])
    if @authentication.save
      redirect_to authentications_url, :notice => "Successfully created authentication."
    else
      render :action => 'new'
    end
  end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end
  
  def linkedin
    raise omni = request.env["omniauth.auth"].to_yaml
  end
  
  def twitter
    raise omni = request.env["omniauth.auth"].to_yaml
  end
  
  def facebook
    raise omni = request.env["omniauth.auth"].to_yaml
  end
end
