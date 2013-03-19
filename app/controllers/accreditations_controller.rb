class AccreditationsController < ApplicationController
  # GET /accreditations
  # GET /accreditations.json
  def index
    @accreditations = Accreditation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @accreditations }
    end
  end

  # GET /accreditations/1
  # GET /accreditations/1.json
  def show
    @accreditation = Accreditation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @accreditation }
    end
  end

  # GET /accreditations/new
  # GET /accreditations/new.json
  def new
    @accreditation = Accreditation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @accreditation }
    end
  end

  # GET /accreditations/1/edit
  def edit
    @accreditation = Accreditation.find(params[:id])
  end

  # POST /accreditations
  # POST /accreditations.json
  def create
    @accreditation = Accreditation.new(params[:accreditation])

    respond_to do |format|
      if @accreditation.save
        format.html { redirect_to @accreditation, notice: 'Accreditation was successfully created.' }
        format.json { render json: @accreditation, status: :created, location: @accreditation }
      else
        format.html { render action: "new" }
        format.json { render json: @accreditation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /accreditations/1
  # PUT /accreditations/1.json
  def update
    @accreditation = Accreditation.find(params[:id])

    respond_to do |format|
      if @accreditation.update_attributes(params[:accreditation])
        format.html { redirect_to @accreditation, notice: 'Accreditation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @accreditation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accreditations/1
  # DELETE /accreditations/1.json
  def destroy
    @accreditation = Accreditation.find(params[:id])
    @accreditation.destroy

    respond_to do |format|
      format.html { redirect_to accreditations_url }
      format.json { head :no_content }
    end
  end
end
