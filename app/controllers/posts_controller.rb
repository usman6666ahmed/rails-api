class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: Post.all
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
