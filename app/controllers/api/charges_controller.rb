class Api::ChargesController < ApplicationController

  def new
	  @user = current_user
  end

  def referral_code_check
    code=params[:referral_code]
    event_id=params[:event_id]
    referral_code=ReferralCode.where(:code=>code).first
    if referral_code
      if referral_code.is_valid
        if referral_code.event_id==event_id.to_i
          if current_user.events_attended.count==0
            #referral_code.redeemed_num=referral_code.redeemed_num+1
            #referral_code.save!
            details="Discount applied!"
            note="success"
            applied=true
          else
            details="This referral code is only valid if this is your first Simmr event!"
            note="not first event"
            applied=false
          end
        else
          details="The referral code you applied is only valid for the #{referral_code.event.title} event"
          note="wrong event"
          applied=false
        end
      else
        details="This code is no longer valid."
        note="invalid"
        applied=false
      end
    else
      details="Sure you have the right code? Check with your friend to make sure you have the right one!"
      note="incorrect"
      applied=false
    end
    render json:{applied: applied, note:note, details:details, referral_code:referral_code}.to_json

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
        stripe_charge_id: new_charge.id,
        refund_due: 0
      })
      @charge.save!
      ticket_info = {
        :user_id => current_user.id,
        :event_id => params[:charge][:event_id],
        :num_guests => params[:charge][:guests].count - 1,
        :total_paid => @charge.amount,
        :discount => 0
      }
      @ticket = @charge.tickets.create(ticket_info)
      @ticket.save!
      if params[:charge][:discount_stuff][:applied]
        @ref_code=ReferralCode.find(params[:charge][:discount_stuff][:referral_code][:id])
        @ticket.applied_code_id = @ref_code.id
        @ticket.discount = @ref_code.referee_discount*100
        @ticket.discount_applied = true
        @ticket.save!
        @ref_code.redeemed_num = @ref_code.redeemed_num + 1
        @ref_code.save!
        @old_ticket = @ref_code.ticket_generated_from
        @old_ticket.discount = @old_ticket.discount + @ref_code.referer_discount*100
        @old_ticket.discount_applied = false
        @old_ticket.save!
        @old_charge = @old_ticket.charge
        @old_charge.refund_due = @old_charge.refund_due + @ref_code.referer_discount*100
        @old_charge.save!
      end
      code,new_ref_code_id=ReferralCode.generate(@ticket)
      @ticket.giveaway_code_id=new_ref_code_id
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
      render json:{status:'Success', code:code}.to_json

    end
  end
end
