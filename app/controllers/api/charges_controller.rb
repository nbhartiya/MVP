class Api::ChargesController < ApplicationController

  def new
	@user = current_user
  end

  def create
  	@charge = Charge.new
  	@charge.full_name = params[:charge][:buyer][:name]
  	@charge.last4 = params[:charge][:last4]
  	@charge.user_id = current_user.id
  	@charge.token = params[:charge][:token]
  	@charge.save!
  	#@location = @charge.location.new
  	#@location.address1 = params[:charge][:buyer][:billing_address]
  	#@location.city = params[:charge][:buyer][:billing_city]
  	#@location.state = params[:charge][:buyer][:billing_state]
  	#@location.zipcode = params[:charge][:buyer][:billing_zip]
  	#@location.save!
    params[:charge][:guests].each do |g|
    	@guest = @charge.guests.new
    	@guest.first_name = g[:name]
    	@guest.last_name = g[:name]
    	@guest.user_id = g[:id]
    	@guest.email = g[:email]
    	@guest.save!
    end
    render json:{status:'Success'}.to_json
  end
end
