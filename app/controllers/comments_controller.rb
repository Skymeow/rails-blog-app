class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    render :json=>@comments
  end

  def new
   @post = Post.find(params[:post_id])
   # @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    redirect_to post_path(params[:post_id])
  end

  def update
    comment_updated = Comment.find(params[:id]).update_attributes(comment_params)
    redirect_to post_path(params[:post_id])
  end

  def destroy
      comment_destroyed = Comment.find(params[:id]).destroy()
  end

  private
   def comment_params
     params
     .require(:comment)
     .permit(:comment_text,:title)
   end


end
