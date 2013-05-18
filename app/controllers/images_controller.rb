class ImagesController < ApplicationController
  def index
    @imageable = find_imageable
    @images = @imageable.images
  end

  def show
    @imageable = find_imageable
    @image = @imageable.image
    #not sure this will ALWAYS work yet..
  end

  def new
    @image = Image.new
  end

  def create
    @imageable = find_imageable
    @image = @imageable.images.build(params[:image])
    if @image.save
      flash[notice] = "Successfully created image."
      redirect_to images_url
    else
      render :action => 'new'
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update_attributes(params[:image])
      flash[:notice] = "Successfully updated image."
      redirect_to :id => nil
    else
      render :action => 'edit'
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = "Successfully destroyed image."
    redirect_to images_url
  end

  private

  def find_imageable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
