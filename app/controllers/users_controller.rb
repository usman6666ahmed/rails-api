class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user, only: [:show]

  def index
    render json: User.all
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  private

end
