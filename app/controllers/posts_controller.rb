class PostsController < ApplicationController
  def index
    @user = User.includes(posts: :comments).find(params[:id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    return unless @post.save

    redirect_to post_path
    render 'new'
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
