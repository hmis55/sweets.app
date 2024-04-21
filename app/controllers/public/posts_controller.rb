class Public::PostsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]
  before_action :ensure_guest_user, only: [:new, :edit, :create, :update]
  
  def new
    @post = Post.new
  end

  # 投稿データの保存
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path notice: "投稿が成功しました."
    else
      render :new
    end
  end

  def index
   @posts = Post.all

  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @post_comment = PostComment.new
  end

  def edit
     @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id), notice: "編集が成功しました."
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post_id = @post.id
    @post.destroy
    redirect_to mypage_path
  end
  # 投稿データのストロングパラメータ
  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :user_id)
  end

  def is_matching_login_user
    user =  Post.find(params[:id]).user
    unless user.id == current_user.id
      redirect_to root_path
    end
  end
  
  def ensure_guest_user
    if current_user.email == "guest@example.com"
      redirect_to user_path(current_user), notice: "投稿される際は、会員登録をお願いします。"
    end
  end
end
