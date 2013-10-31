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
    event_images=params[:event][:event_image_urls]
    event_params=params[:event]
    event_params.delete("event_image_urls")
    location_params = params[:event][:location]
    event_params.delete("location")
    @event = Event.create(event_params)
    @event.build_location(location_params)
    @event.save!
    if event_images.present?
      for i in event_images
        @event.covers.new(:image=>i)
        @event.save!
      end
    end
    render json: @event.to_json(include_hash)
  end

  def update
    @event = Event.find(params[:id])
    event_params=params[:event]
    event_params.delete("id")
    event_params.delete("guests")
    event_params.delete("tickets")
    event_params.delete("follows")
    location_params=params[:event][:location]
    event_images=params[:event][:event_image_urls]
    event_params.delete("event_image_urls")
    event_params.delete("location")
    event_params.delete("host")
    event_params.delete("created_at")
    event_params.delete("updated_at")
    event_params.delete("referee_discount")
    event_params.delete("referer_discount")
    event_params.delete("approved")
    @event.update_attributes(event_params)
    if @event.location.present?
      location_params.delete("created_at")
      location_params.delete("updated_at")
      @event.location.update_attributes(location_params)
    else
      @location=@event.create_location(location_params)
      @location.save!
    end
    if event_images.present?
      for i in @event.covers
        i.delete
      end
      for i in event_images
        @event.covers.new(:image=>i)
        @event.save!
      end
    end
    render json: @event.to_json(include_hash)
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  end

private
  def include_hash
    {:include => [:guests, :tickets, :location, :follows, :host => {:include => :profile}]}
    #to optimize get only the data you need by :only=>
    #{:methods => :display_name, :include => [{:venue => {:include => :place}}, :users]}
    #=> {:only => :hi}
  end

end