class PostsController < ApplicationController
  def index
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def show
    @post = User.find(params[:id]).posts.find(params[:post_id])
  end

  def new
    @post = Post.new(user: current_user)
    puts @post.user.name
  end

  def create
    post = Post.new(author_id: current_user.id, title: params[:post][:title], text: params[:post][:text])
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

  def like
    @post = Post.find(params[:id])
    like = Like.new(user: current_user, post: @post)
    if @post.likes.find_by(user_id: current_user.id)
      flash[:notice] = 'You already liked this post'
    elsif like.save
      flash[:success] = 'You like this post'
    end
    render :show
  end

  def comment
    @post = Post.find(params[:id])
    comment = Comment.new(user: current_user, post: @post, text: params[:comment][:text])
    return unless comment.save

    redirect_to "/users/#{current_user.id}/posts/#{@post.id}"
  end
end
