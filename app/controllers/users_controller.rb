class UsersController < ApplicationController
  before_action :ensure_current_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @item = Item.new
    @allitems = Item.all
    @items = Item.where(user_id: @user.id)
  end

  def index
    @users = User.all
    @user = current_user
    @item = Item.new
  end

  def edit
    @user = User.find(params[:id])
    unless @user = current_user
      render user_path(@user.id)
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "ユーザー情報更新に成功しました！"
    else
      render "edit", notice: "ユーザー情報を更新できませんでした"
    end
  end

  private
  def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_current_user
  @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end