class Api::CampaignsController < ApplicationController
  
  
  skip_before_filter :authenticate_user!, :only => [:index, :show]
  
  # GET /campaigns
  # GET /campaigns.json
  def index
    @campaigns = Campaign.all
    render json: @campaigns.to_json(include_hash)
  end  

  def show
    @campaign = Campaign.find(params[:id])
    render json: @campaign.to_json(include_hash)
  end

  def create
    @campaign = Campaign.create(params[:campaign])
    render json: @campaign.to_json(include_hash)
  end

  def update
    @campaign = Campaign.find(params[:id])
    params[:campaign].delete("id")
    params[:campaign].delete("created_at")
    params[:campaign].delete("updated_at")
    params[:campaign].delete("follows")
    @campaign.update_attributes(params[:campaign])
    render json: @campaign.to_json(include_hash)
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy
  end

private
  def include_hash
    {:include => [:follows]}
    #{:methods => :display_name, :include => [{:venue => {:include => :place}}, :users]}
    #=> {:only => :hi}
  end
end
