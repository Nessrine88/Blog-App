# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = 'Comment created successfully.'
    else
      flash[:error] = 'Error: Comment could not be created'
    end
    redirect_to post_path(@post)
  end

  def destroy
    authorize! :delete, @comment
    post = @comment.post # Assuming the comment belongs to a post
    @comment.destroy
    redirect_to user_post_path(post.user, post), notice: 'Comment was successfully deleted.'
  end  

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
