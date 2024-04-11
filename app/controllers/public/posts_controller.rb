class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  # 投稿データの保存
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def index
   @user = current_user
   @post = Post.new
   @posts = Post.all
  end

  # 投稿データのストロングパラメータ
  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
