class Public::FavoritesController < ApplicationController
 before_action :authenticate_user!
 before_action :is_matching_login_user
 
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

  def is_matching_login_user
     post = Post.find_by(id: params[:post_id])
    unless post.user_id == current_user.id
     redirect_to root_path
    end
  end
end
