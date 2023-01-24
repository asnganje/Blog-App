class PostsController < ApplicationController
  # GET /posts or /posts.json
  def index
    @user = User.find(params[:user_id])
  end

  # GET /posts/1 or /posts/1.json
  def show
    @post = Post.find(params[:id])
  end
end
