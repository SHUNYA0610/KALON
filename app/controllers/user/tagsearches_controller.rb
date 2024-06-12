class User::TagsearchesController < ApplicationController
  def search
    @model = Post
    @word = params[:content]
    @posts = Post.where("category LIKE ?", "%#{@word}%")
    render "user/tagsearches/tagsearch"
  end
end