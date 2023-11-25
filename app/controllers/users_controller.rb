class UsersController < ApplicationController
  layout 'users'
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
