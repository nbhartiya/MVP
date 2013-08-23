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
  	@ticket = Ticket.new
    @ticket.user_id = current_user.id
    @ticket.event_id = params[:charge][:event_id]
    @ticket.num_guests = params[:charge][:guests].count - 1
    @charge.save!
    @ticket.charge_id = @charge.id
    @ticket.save!
    params[:charge][:guests].each do |g|
    	@guest = @charge.guests.new
    	@guest.first_name = g[:first_name]
    	@guest.last_name = g[:last_name]
    	@guest.user_id = g[:id]
    	@guest.email = g[:email]
      @guest.event_id = @ticket.event_id
      @guest.ticket_id = @ticket.id
    	@guest.save!
    end
    render json:{status:'Success'}.to_json
  end
end
