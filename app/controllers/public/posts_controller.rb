class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  # 投稿データの保存
  def create
    @post = Post.new(post_image_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to post_path
  end
  
  
  # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post).permit(:title, :body)
  end
  
end
