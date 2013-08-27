class Api::ProfilesController < ApplicationController
  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
    render json: @profiles.to_json(include_hash)
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = Profile.find(params[:id])
    render json: @profile.to_json(include_hash)
  end

  def update
    @profile = Profile.find(params[:id])
    profile_params=params[:profile]
    profile_images=params[:profile][:profile_image_urls]
    profile_params.delete("profile_image_urls")
    location_params = params[:profile][:location]
    user_params = params[:profile][:user]
    location_params.delete("created_at")
    location_params.delete("updated_at")
    user_params.delete("created_at")
    user_params.delete("updated_at")
    user_params.delete("completed")
    profile_params.delete("location")
    profile_params.delete("user")
    profile_params.delete("covers")
    profile_params.delete("follows")
    profile_params.delete("created_at")
    profile_params.delete("updated_at")
    if params[:profile][:avatar].present?
      avatar_params=params[:profile][:avatar][0]
      if @profile.avatar.present?
        @profile.avatar.image=avatar_params
        @profile.avatar.save!
      else
        @profile.create_avatar(:image=>avatar_params)
      end
    end
    profile_params.delete("avatar")
    @profile.update_attributes(profile_params)

    if @profile.location.present?
      @profile.location.update_attributes(location_params)
    else
      @location=@profile.create_location(location_params)
      @location.save!
      @profile.location_id=@location.id
      @profile.save!
    end
    # may want to only update the email....
    @profile.user.update_attributes(user_params)
    if profile_images.present?
      #if @profile.covers.present?
      #  #need to figure out how to delete all of them or update all of them individually
      #else
      for i in profile_images
        @profile.covers.create(:image=>i)
        @profile.save!
      end
      #end
    end
    render json: @profile.to_json(include_hash)
  end

  # POST /profiles
  # POST /profiles.json
  def create
    profile_params=params[:profile]
    avatar_params=params[:profile][:avatar]
    if current_user.chef?
      location_params=params[:profile][:location]
      cover_params=params[:profile][:cover_image_url]
      profile_params.delete("location")
      profile_params.delete("cover_image_url")
    end
    profile_params.delete("avatar")
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    @profile.create_avatar(:image=>avatar_params)
    if current_user.chef?
      @profile.save!
      @profile.covers.create(:image=>cover_params)
      @location = Location.new(location_params)
      @location.save!
      @profile.location_id=@location.id
    end
    @profile.save!
    #render json: @profile.to_json(include_hash)
    if current_user.chef?
      redirect_to new_event_path
    else
      redirect_to events_path
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
  end

  private
  def include_hash
    {:include => [:covers, :avatar, :location, :follows, :user]}
    #{:methods => :display_name, :include => [{:venue => {:include => :place}}, :users]}
    #=> {:only => :hi}
  end
end