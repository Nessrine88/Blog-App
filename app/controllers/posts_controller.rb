class PostsController < ApplicationController
  def index
    @users = User.all
    @posts = Post.all
    @comments = Comment.all
  end

  def show
    @post = User.find(params[:id]).posts.find(params[:post_id])
  end
end
