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
    binding.pry
    @event = Event.create(params[:event])
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
    {:include => [:guests, :tickets]}
    #{:methods => :display_name, :include => [{:venue => {:include => :place}}, :users]}
    #=> {:only => :hi}
  end

end