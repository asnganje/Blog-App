class PostsController < ApplicationController
  # GET /posts or /posts.json
  def index
    @user = User.find(params[:user_id])
  end

  # GET /posts/1 or /posts/1.json
  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @author = current_user
    @post = Post.new(post_params)
    @post.author = @author
    if @post.save
      flash[:notice] = 'Post saved successfully.'
      redirect_to user_path(@author)
    else
      flash.now[:error] = 'Error: Post could not be saved.'
      render :new
    end
  end

  # def create
  # @post = Post.new(post_params)
  # @post.author = current_user
  # if @post.save
  # flash[:success] = 'Post created!'
  # redirect_back_or_to user_post_path(current_user, @post)
  # redirect_to user_post_path(current_user, @post)
  # else
  # flash.now[:error] = 'Post not created!'
  # render :new, status: :unprocessable_entity
  # render :new
  # end
  # end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
