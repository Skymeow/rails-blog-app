class PostsController < ApplicationController
  # before_action :authenticate_user!
  def index
    # if user_signed_in?
    #   redirect_to posts_path
    # end
    # assign all posts from model to instance variable to pass into index view
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment=@post.comments.build
    @comments = @post.comments
  end

  def new
  end

  def create
    post = Post.create(post_params)
    # redirect to /posts via route prefix as defined by "resources :posts"
    redirect_to posts_path
  end

  def update
    post_update = Post.find(params[:id])
    post_update.update(post_params)
  end

  def edit
    @post_update = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id]).destroy
    redirect_to posts_path

  end

  private
  # "strong parameters" used in mass-assignments as per the above code and to increase the security to reject ant parameter that are not permitted here
  def post_params
    params
    .require(:post)
    .permit(:post_text,:title,:post_image)
  end

end
