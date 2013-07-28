class Api::EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    render json: @events.to_json(include_hash)
  end  

  def show
    @event = Event.find(params[:id])
    render json: @event.to_json(include_hash)
  end

  def create
    event_params=params[:event]
    location_params = params[:event][:location]
    event_params.delete("location")
    @event = Event.create(event_params)
    #there is an error here if one of the below is nil...check out later
    location_params.merge!("event_id"=>@event.id)
    @location = Location.create(location_params)
    render json: @event.to_json(include_hash)
  end

  def update
    @event = Event.find(params[:id])
    params[:event].delete("id")
    params[:event].delete("guests")
    params[:event].delete("tickets")
    params[:event].delete("follows")
    params[:event].delete("location")
    params[:event].delete("host")
    params[:event].delete("created_at")
    params[:event].delete("updated_at")
    @event.update_attributes(params[:event])
    render json: @event.to_json(include_hash)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  end

private
  def include_hash
    {:include => [:guests, :tickets, :location, :follows, :host => {:include => :profile}]}
    #{:methods => :display_name, :include => [{:venue => {:include => :place}}, :users]}
    #=> {:only => :hi}
  end

end