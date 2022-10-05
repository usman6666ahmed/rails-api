class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: User.all
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def me
    render json: current_user
  end
end
