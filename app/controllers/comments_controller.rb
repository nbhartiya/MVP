class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    @commentable = find_commentable
    @comments = @commentable.comments
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @commentable = find_commentable
    @comment = @commentable.comment
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(params[:comment])
    if @comment.save
      flash[notice] = "Successfully created comment."
    else
      render :action => 'new'
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice]="Successfully updated comment."
      redirect_to :id => nil
    else
      render :action => 'edit'
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Successfully destroyed comment."
    redirect_to comments_url
  end

private

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

end
