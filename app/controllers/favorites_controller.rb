class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    micropost = Micropost.find(params[:favorite][:micropost_id])
    user = User.find(params[:favorite][:user_id])
    current_user.favor(micropost)
    flash[:success] = '投稿をお気に入りに追加しました。'
    redirect_to user
  end

  def destroy
    micropost = Micropost.find(params[:favorite][:micropost_id])
    user = User.find(params[:favorite][:user_id])
    current_user.disfavor(micropost)
    flash[:success] = '投稿をお気に入りから解除しました。'
    redirect_to user
  end
end
