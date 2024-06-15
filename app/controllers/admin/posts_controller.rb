class Admin::PostsController < ApplicationController
  
  def index
    @post = Post.new
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post_detail = Post.find(params[:id])
    @post = Post.find(params[:id])
    @user = @post.user
    @new_post = Post.new
    @post_comment = PostComment.new
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_posts_path
  end
  
end
