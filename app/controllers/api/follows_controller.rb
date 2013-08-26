class Api::FollowsController < ApplicationController

  def index
    @follow = Follow.where("followable_id = ? AND followable_type = ? AND user_id = ?",params[:followable_id],params[:followable_type],current_user.id)
    render json: @follow.to_json
    #redirect_to "/#{params[:followable_type].downcase.pluralize}/#{params[:followable_id]}"
  end
  
  def show
    binding.pry
  	@followable = find_followable
  	@follow = @followable.follow
  	# TODO Check this
  end

  def new
  	@follow = @followable.follows.new
  end

  def create
  	follow_params=params
    follow_params.delete("action")
    follow_params.delete("controller")
    follow_params[:user_id]=current_user.id
  	@follow = Follow.create(follow_params)
  	@follow.save
    render json: @follow.to_json
  end

  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy
    render json:{}
  end

  # TODO: Need to add correct versions of edit, update, destroy

private
  def find_followable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

end
