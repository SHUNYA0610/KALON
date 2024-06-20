class Admin::TagsearchesController < ApplicationController
  def search
    @model = Post
    @word = params[:content]
    @posts = Post.where("category LIKE ?", "%#{@word}%")
    render "admin/tagsearches/tagsearch"
  end
    @banners = Banner.all
end