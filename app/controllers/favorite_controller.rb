class FavoriteController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.add_favorite(micropost)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_to micropost
  end

  def destroy
    micropost = User.find(params[:micropost_id])
    current_user.cut_favorite(micropost)
    flash[:success] = 'お気に入りを外しました。'
    redirect_to micropost
  end
end
