class UsersController < ApplicationController

  def index 
  end
  
  def show
  end

# TODO: come back to this
  def incomplete
    current_user.complete!(params[:kind])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      if !@user.kind.empty?
        @user.complete!
        flash[:notice] = "User was successfully saved."
        redirect_to new_user_registration_path
      else
        render action: "edit"
      end
    else
      render action: "edit"      
    end
  end

end
