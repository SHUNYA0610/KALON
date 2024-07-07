class Admin::GroupsController < ApplicationController

  def index
    @groups = Group.all
    @banners = Banner.all
  end

  def show
    @group = Group.find(params[:id])
    @banners = Banner.all
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to admin_groups_path
  end
  
end
