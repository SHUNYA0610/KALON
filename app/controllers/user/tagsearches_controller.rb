class User::TagsearchesController < ApplicationController
  def search
    @model = Post
    @word = params[:content]
    @posts = Post.where("category LIKE ?", "%#{@word}%")
    render "user/tagsearches/tagsearch"
    @new_post = Post.new
  end
end