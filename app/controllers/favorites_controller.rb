class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    #user = User.find(params[:micropost_id])
    micropost = Micropost.find params[:favorite][:micropost_id]
    user = micropost.user
    current_user.like(micropost)
    flash[:success] = '投稿をお気に入りに登録しました。'
    redirect_to user
  end

  def destroy
    favorite = Favorite.find(params[:id])
    # current_user.unlike(micropost)
    favorite.destroy!
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to root_path
  end
end
