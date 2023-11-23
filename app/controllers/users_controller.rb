class UsersController < ApplicationController
  layout 'users'

  def index
    @users = User.includes(:posts).all
  end

  def show
    @user = User.includes(posts: :comments).find(params[:id])
  end
end
