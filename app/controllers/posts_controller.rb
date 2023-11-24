class PostsController < ApplicationController
  def index
    @user = User.includes(posts: :comments).find(params[:id])
    @posts = @user.posts
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
  end
  

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to post_path(@user, @post)
    else
      render 'new'
    end
  end

  def destroy
    authorize! :delete, @post
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully deleted.'
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
