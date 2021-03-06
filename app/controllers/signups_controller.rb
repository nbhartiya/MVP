class SignupsController < ApplicationController
  
  skip_before_filter :authenticate_user!
  
  # GET /signups
  # GET /signups.json
#  def index
#    @signups = Signup.all
#
#    respond_to do |format|
#      format.html # index.html.erb
#      format.json { render json: @signups }
#    end
#  end

  # GET /signups/1
  # GET /signups/1.json
#  def show
#    @signup = Signup.find(params[:id])
#
#    respond_to do |format|
#      format.html # show.html.erb
#      format.json { render json: @signup }
#    end
#  end

  # GET /signups/new
  # GET /signups/new.json
  def new
    @signup = Signup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @signup }
    end
  end

  # GET /signups/1/edit
#  def edit
#    @signup = Signup.find(params[:id])
#  end

  # POST /signups
  # POST /signups.json
  def create
    session[:return_to] ||= request.referer
    @signup = Signup.new(params[:signup])
    if Signup.where(:email => @signup.email).length != 0
      redirect_to session.delete(:return_to), notice: "You already signed up!"
      #respond_to do |format|
      #  format.html { redirect_to "/thanks", notice: 'You like us bro. If you wanna signup again ask us to delete your record first!'}
      #end
    #else
      #respond_to do |format|
        #if 
    else
      @signup.save
      redirect_to session.delete(:return_to)


          #format.html { redirect_to "/done" }
          #format.json { render json: @signup, status: :created, location: @signup }
        #else
          #format.html { render action: "new", notice: 'Something went wrong! Make sure your email address is valid! :)' }
          #format.json { render json: @signup.errors, status: :unprocessable_entity }
        #end
      #end    

    end

    
  end

  # PUT /signups/1
  # PUT /signups/1.json
#  def update
#    @signup = Signup.find(params[:id])
#
#    respond_to do |format|
#      if @signup.update_attributes(params[:signup])
#        format.html { redirect_to @signup, notice: 'Signup was successfully updated.' }
#        format.json { head :no_content }
#      else
#        format.html { render action: "edit" }
#        format.json { render json: @signup.errors, status: :unprocessable_entity }
#      end
#    end
#  end

  # DELETE /signups/1
  # DELETE /signups/1.json
  def destroy
    @signup = Signup.find(params[:id])
    @signup.destroy

    respond_to do |format|
      format.html { redirect_to signups_url }
      format.json { head :no_content }
    end
  end
  
  def done
  end

  def thanks
  end
end