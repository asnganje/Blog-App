class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to user_post_path(current_user, @comment.post)
    else
      render :create
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment.post_id)
    @post.decrement!(:comments_counter)
    @comment.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
