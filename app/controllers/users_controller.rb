class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
    process_request(user, :save)
  end

  def show
    process_request(User, :find, params[:id])
  end

  def destroy
    user = User.find(params[:id])
    process_request(user, :destroy)
  end

  def update
    user = User.find(params[:id])
    process_request(user, :update, user_params)
  end

  private
  def user_params
    params[:user].permit(:name, :email)
  end
end
