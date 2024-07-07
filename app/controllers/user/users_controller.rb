class User::UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  

  def index
    @users = User.all
    @user = current_user
    @post = Post.new
    @banners = Banner.all
    @rooms = @user.rooms
  end

  def show
    @banners = Banner.all
    @user = User.find(params[:id])
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
    @posts = @user.posts.order(created_at: :desc)
    @post = Post.new
    @banners = Banner.all
  end

  def edit
    redirect_to current_user if current_user.guest?
    @user = User.find(params[:id])
    @new_post = Post.new
    @banners = Banner.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @banners = Banner.all
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  def favorites
    @user = User.find(params[:id])
    favorites= Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.where(id: favorites).order(created_at: :desc)
    @post = Post.new
    @banners = Banner.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :back_image)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end
  
end