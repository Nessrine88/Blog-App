class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).all
  end

  def show
    @post = User.find(params[:id]).posts.find(params[:post_id])
  end
end
