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

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
    @profile.update_attributes(params[:profile])
    render json: @profile.to_json(include_hash)
  end

  # POST /profiles
  # POST /profiles.json
  def create
    binding.pry
    #profile_params=params[:profile]
    #survey_params = params[:profile][:survey]
    #profile_params.delete("location")
    @profile = Profile.new(params[:profile])
    #survey_params.merge!("event_id"=>@event.id)
    #@survey = SurveyAnswer.create(survey_params)
    render json: @profile.to_json(include_hash)
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
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
    {:include => [:covers, :avatar]}
    #{:methods => :display_name, :include => [{:venue => {:include => :place}}, :users]}
    #=> {:only => :hi}
  end
end