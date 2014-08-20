class UsersController < ApplicationController
  before_action :require_current_user!, except: [:create]

  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id]), include: :subscriptions
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      render json: @user
    else
      render json: @user.errors.full_messages
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
