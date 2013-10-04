class Api::ChargesController < ApplicationController

  def new
	  @user = current_user
  end

  def create
    parameters = {
      :full_name => params[:charge][:buyer][:name],
      :user_id => current_user.id,
      :stripe_token => params[:charge][:token],
    }
    @charge=Charge.create(parameters)
    charge_info =  {
      :amount => ((params[:charge][:amount]).to_f*100).to_i,
      :currency => @charge.currency,
      :card => @charge.stripe_token, # obtained with Stripe.js
      :description => "Ticket Purchase for Event: #{params[:charge][:event_id]}"
    }
    begin
      new_charge = Stripe::Charge.create(charge_info)
    rescue Stripe::CardError => e
      @charge.status = e.code
      @charge.save!
      @charge.errors.add :base, "#{e.message}"
    #rescue Stripe::InvalidRequestError => e
    # Invalid parameters were supplied to Stripe's API
    #rescue Stripe::AuthenticationError => e
    # Authentication with Stripe's API failed
    # (maybe you changed API keys recently)
    #rescue Stripe::APIConnectionError => e
    # Network communication with Stripe failed
    #rescue Stripe::StripeError => e
    # Display a very generic error to the user, and maybe send
    # yourself an email
    #rescue => e
    end
    if @charge.errors.present?
      render json: {status:'Failure',messages:@charge.errors.messages[:base]}.to_json
    else
      puts "Charge info: " + new_charge.inspect
      @charge.assign_attributes({
        status: 'paid',
        amount: new_charge.amount,
        amount_refunded: new_charge.amount_refunded,
        last4: new_charge.card.last4,
        card_type: new_charge.card.type,
        stripe_charge_id: new_charge.id
      })
      @charge.save!
      ticket_info = {
        :user_id => current_user.id,
        :event_id => params[:charge][:event_id],
        :num_guests => params[:charge][:guests].count - 1,
        :total_paid => @charge.amount
      }
      @ticket = @charge.tickets.create(ticket_info)
      @ticket.save!
      location_info = {
        :address1 => params[:charge][:buyer][:billing_address],
        :city => params[:charge][:buyer][:billing_city],
        :state => params[:charge][:buyer][:billing_state],
        :zipcode => params[:charge][:buyer][:billing_zip]
      }
      @location = Location.create(location_info)
      @location.save!
      @charge.location_id=@location.id
      @charge.save!
      params[:charge][:guests].each do |g|
      	@guest = @charge.guests.new
      	@guest.first_name = g[:first_name]
      	@guest.last_name = g[:last_name]
      	@guest.user_id = g[:user_id]
      	@guest.email = g[:email]
        @guest.event_id = @ticket.event_id
        @guest.ticket_id = @ticket.id
      	@guest.save!
      end
      render json:{status:'Success'}.to_json
    end
  end
end
