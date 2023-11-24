class UsersController < ApplicationController
  layout 'users'
  before_action :authenticate_user!

  def index
    @users = User.includes(:posts).all
  end

  def show
    @user = User.includes(posts: :comments).find(params[:id])
  end
end
