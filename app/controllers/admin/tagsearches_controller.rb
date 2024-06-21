class Admin::TagsearchesController < ApplicationController
  def search
    @model = Post
    @word = params[:content]
    @posts = Post.where("category LIKE ?", "%#{@word}%")
    @banners = Banner.all
    render "admin/tagsearches/tagsearch"
  end
end