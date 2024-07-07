class Admin::UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
    @banners = Banner.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    @banners = Banner.all
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_users_path
  end

  def change_is_group_creator
    user = User.find(params[:user_id])

    if user.is_group_creator == true
      user.is_group_creator = false
    else
      user.is_group_creator = true
    end

    user.save
    redirect_to admin_user_path(params[:user_id])
  end

end