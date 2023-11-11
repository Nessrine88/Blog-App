class UsersController < ApplicationController

  def index
    @users = User.all
    @posts = Post.all
  end

  def show
    @users = User.find(params[:id])
    @posts = Post.all
  end

end