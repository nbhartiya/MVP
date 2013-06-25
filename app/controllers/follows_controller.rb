class FollowsController < ApplicationController

  def index
  	@followable = find_followable
  	@follows = @followable.follows
  end
  
  def show
  	@followable = find_followable
  	@follow = @followable.follow
  	# TODO Check this
  end

  def new
  	@follow = @followable.follows.new
  end

  def create
  	@followable = find_followable
  	@follow = @followable.follows.build(params[:follow])
  	if @follow.save
  	  flash[notice] = "successfully followed."
  	  redirect_to follows_url, notice: "Follow created."
  	else
  	  render :action => 'new'
  	end
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
