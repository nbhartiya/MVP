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
    location_params.merge!("event_id"=>@event.id)
    binding.pry
    @location = Location.create(location_params)
    render json: @event.to_json(include_hash)
  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(params[:event])
    render json: @event.to_json(include_hash)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  end

private
  def include_hash
    {:include => [:guests, :tickets, :location]}
    #{:methods => :display_name, :include => [{:venue => {:include => :place}}, :users]}
    #=> {:only => :hi}
  end

end