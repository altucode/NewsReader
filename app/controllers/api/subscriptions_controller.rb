class SubscriptionsController < ApplicationController
  before_action :require_current_user!

  def index
    if params.include?(:user_id)
      render json: User.find(params[:user_id]).feeds
    elsif params.include?(:feed_id)
      render json: Feed.find(params[:feed_id]).subscribers
    else
      render json: { error: 'invalid'}
    end
  end

  def create
    @subscription = Subscription.new(sub_params)

    if @subscription.save
      render json: @subscription
    else
      render json: @subscription.errors.full_messages
    end
  end

  def destroy
    Subscription.delete(params[:id])
    render json: {}
  end

  private
  def sub_params
    params.require(:subscription).permit(:user_id, :feed_id)
  end
end
