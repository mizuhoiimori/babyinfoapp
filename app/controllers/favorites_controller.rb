class FavoritesController < ApplicationController
    before_action :authenticate_user!
  
  def create
    @item = Item.find(params[:item_id])
    @favorite = current_user.favorites.new(item_id: params[:item_id])
    @favorite.save
    # redirect_to request.referer
  end

  def destroy
    @item = Item.find(params[:item_id])
    @favorite = Favorite.find_by(item_id: params[:item_id], user_id: current_user.id)
    @favorite.destroy
    # redirect_to request.referer
  end
end
