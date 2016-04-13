class UsersController < ApplicationController

  # GET /products
  # GET /products.json
  def index
    @users = User.all
    render json: @users
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @user = User.find(params[:id])
    render json: @user
  end

end
