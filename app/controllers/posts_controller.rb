class PostsController < ApplicationController
  # GET /posts or /posts.json
  def index
    @user = User.find(params[:user_id])
  end

  # GET /posts/1 or /posts/1.json
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = 'Post created!'
      redirect_to user_post_path(current_user, @post)
    else
      flash.now[:error] = 'Post not created!'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
