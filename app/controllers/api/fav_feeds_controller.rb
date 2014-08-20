class FavFeedsController < ApplicationController
  before_action :require_current_user!

  def create
    @fav_feed = FavFeed.new(fav_params)
  end

  def destroy
    FavFeed.delete(params[:id])
    render json: {}
  end

  private
  def fav_params
    params.require(:fav_feed).permit(:user_id, :feed_id)
  end
end
