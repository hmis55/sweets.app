class Public::FavoritesController < ApplicationController
 before_action :authenticate_user!
 before_action :ensure_guest_user


 def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: post.id)
    favorite.save
    redirect_to post_path(post)
 end

 def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to post_path(post)
 end
 
 private
 
 def ensure_guest_user
    if current_user.email == "guest@example.com"
      redirect_to posts_path, notice: "この機能は会員登録後に使用可能となります。"
    end
 end
 
end
