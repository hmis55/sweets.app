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

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def edit
     @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id), notice: "Post was successfully updated."
    else
      render :post_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post_id = @post.id
    @post.destroy
    redirect_to posts_path
  end
  # 投稿データのストロングパラメータ
  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :user_id)
  end
end
