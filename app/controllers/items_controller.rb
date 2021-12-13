class ItemsController < ApplicationController
before_action :ensure_current_user,{only: [:edit, :update, :destroy]}

  def show
    @item = Item.find(params[:id])
    @user = @item.user
    @item_new = Item.new
    @item_comment = ItemComment.new
    @item_comments = ItemComment.find_by(params[:id])
  end

  def index
    @item = Item.new
    @items = Item.all
    @user = current_user
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item), notice: "投稿に成功しました！"
    else
      @items = Item.all
      render 'index', notice: "投稿に失敗しました"
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item), notice: "投稿内容を更新しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

  private

  def ensure_current_user
    @item = Item.find(params[:id])
    if @item.user_id != current_user.id
      redirect_to items_path
    end
  end

  def item_params
    params.require(:item).permit(:name, :body, :item_image, :store, :price, :category, :evaluation)
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
