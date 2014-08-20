class FavEntriesController < ApplicationController
  before_action :require_current_user!

  def create
    @fav_entry = FavEntry.new(fav_params)
    if @fav_entry.save
      render json: @fav_entry
    else
      render json: @fav_entry.errors.full_messages
    end
  end

  def destroy
    FavEntry.delete(params[:id])
    render json: {}
  end

  private
  def fav_params
    params.permit(:fav_entry).require(:user_id, :entry_id)
  end
end
