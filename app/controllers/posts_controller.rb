class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def show
    @post = User.find(params[:id]).posts.find(params[:post_id])
  end

  def new
    @post = Post.new
    puts @post.user.name
  end

  def create
    post = Post.new
    puts "Name: #{post.user.name} Title: #{post.title} Text: #{post.text}"
    respond_to do |format|
      format.html do
        if post.save
          puts 'Success'
          flash[:success] = 'Post created successfully'
          redirect_to "/users/#{current_user.id}/posts"
        else
          puts 'error', post.errors.full_messages
          flash.now[:error] = 'Error: Post could not be created'
          render :new
        end
      end
    end
  end
end
