class User::PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all.order(created_at: :desc)
    @following_posts= Post.where(user_id: [*current_user.following_ids]).order(created_at: :desc)
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save!
    if @post.save
      redirect_to post_path(@post)
    else
      @user = current_user
      @posts = Post.all
      render :index
    end
  end
  
  def show
    @post_detail = Post.find(params[:id])
    unless ViewCount.find_by(user_id: current_user.id, post_id: @post_detail.id)
      current_user.view_counts.create(post_id: @post_detail.id)
    end
    @post = Post.find(params[:id])
    @user = @post.user
    @new_post = Post.new
    @post_comment = PostComment.new
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end
  
  def edit
    @post = Post.find(params[:id])

  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end
  
  private

  def post_params
    params.require(:post).permit(:image, :shop, :caption, :category)
  end
  
end
