class PostsController < ApplicationController
  
  before_action :ensure_logged_in
  
  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save 
      redirect_to post_url(@post)
    else 
      flash.now[:errors] = @post.errors.full_messages
    end 
  end

  def update
    @post= Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_url(@post)
    else 
      flash.now[:errors] = @post.errors.full_messages
      render :edit 
    end 
  end
  
  def post_params 
    params.require(:post).permit(:url, :title, :content, :user_id, sub_ids: [])
  end 
end
