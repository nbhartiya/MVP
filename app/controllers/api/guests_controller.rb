class Api::GuestsController < ApplicationController

  #def index
  #  @guests = Guest.all
  #  render json: @guests.to_json
  #end  

  #def show
  #  @guest = Guest.find(params[:id])
  #  render json: @location.to_json
  #end

  def create
    @guest = Guest.create(params[:guest])
    @guest.save
    render json: @guest.to_json
  end

  #def update
  #  @guest = Guest.find(params[:id])
  #  @guest.update_attributes(params[:guest])
  #  render json: @guest.to_json
  #end

  #def destroy
  #  @guest = Guest.find(params[:id])
  #  @guest.destroy
  #end

end
