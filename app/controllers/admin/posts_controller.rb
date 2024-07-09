class Admin::PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all.order(created_at: :desc)
    @banners = Banner.all
  end

  def show
    @post_detail = Post.find(params[:id])
    @post = Post.find(params[:id])
    @user = @post.user
    @post_comment = PostComment.new
    @banners = Banner.all
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_posts_path
  end
end
