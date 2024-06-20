class Admin::BannersController < ApplicationController

  def index
    @banners = Banner.all
  end

  def new
    @banner = Banner.new
  end

  def edit
    @banner = Banner.find(params[:id])
  end

  def create
    @banner = Banner.new(banner_params)
    if @banner.save
      redirect_to admin_banners_path
    else
      render :new
    end
  end

  def update
    @banner = Banner.find(params[:id])
    @banner.update(banner_params)
    redirect_to admin_banners_path
  end

  def destroy
    banner = Banner.find(params[:id])
    banner.destroy
    redirect_to admin_banners_path
  end

  private
  
  def banner_params
    params.require(:banner).permit(:banner_image, :url, :visible)
  end
end