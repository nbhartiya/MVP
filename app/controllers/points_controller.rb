class PointsController < ApplicationController
  # GET /points
  # GET /points.json
  skip_before_filter :authenticate_user!, :only => [:index, :show]
  
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  # GET /points/1
  # GET /points/1.json
  def show
    @user = User.find(params[:id])
    @points = @user.points
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @points }
    end
  end

end
