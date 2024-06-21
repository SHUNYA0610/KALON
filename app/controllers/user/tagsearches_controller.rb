class User::TagsearchesController < ApplicationController
  def search
    @model = Post
    @word = params[:content]
    @posts = Post.where("category LIKE ?", "%#{@word}%")
    @new_post = Post.new
    @banners = Banner.all
    render "user/tagsearches/tagsearch"
  end
end