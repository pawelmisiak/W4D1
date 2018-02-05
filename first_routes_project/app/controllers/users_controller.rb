class UsersController < ApplicationController
  def index
    render json: User.all
  end
  def create
    user = User.new(params[:users].permit(:name, :email))
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end
  def show
    render json: User.find(params[:id])
  end
  def destroy
    user =User.find(params[:id])
    user.destroy
    render json: user
  end
end
