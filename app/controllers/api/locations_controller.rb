class Api::LocationsController < ApplicationController
  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
    render json: @locations.to_json(include_hash)
  end  

  def show
    @location = Location.find(params[:id])
    render json: @location.to_json(include_hash)
  end

  def create
    @location = Location.create(params[:location])
    render json: @location.to_json(include_hash)
  end

  def update
    @location = Location.find(params[:id])
    @location.update_attributes(params[:location])
    render json: @location.to_json(include_hash)
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
  end

private
  def include_hash
    {:include => [:guests, :tickets]}
    #{:methods => :display_name, :include => [{:venue => {:include => :place}}, :users]}
    #=> {:only => :hi}
  end

end
