class HomeController < ApplicationController
  def index
    render json: {message:"Welcome to Rails API"}
  end
end
