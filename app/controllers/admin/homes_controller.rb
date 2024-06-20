class Admin::HomesController < ApplicationController
  def top
    @banners = Banner.all
  end
end