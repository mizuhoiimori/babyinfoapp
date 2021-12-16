class FavoritesController < ApplicationController
    before_action :authenticate_user!
  
  def create
    @item = Item.find(params[:item_id])
    @favorite = current_user.favorites.new(item_id: params[:item_id])
    @favorite.save
    # 非同期通信
  end

  def destroy
    @item = Item.find(params[:item_id])
    @favorite = Favorite.find_by(item_id: params[:item_id], user_id: current_user.id)
    @favorite.destroy
    # 非同期通信
  end
end
