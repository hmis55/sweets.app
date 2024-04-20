class Admin::PostsController < ApplicationControlle
  before_action :authenticate_admin!
  
  def new
    @post = Post.new
  end

  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
   @post = Post.find(params[:id])
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post_id = @post.id
    @post.destroy
    #削除後にadminの投稿一覧ページ(topページに遷移)
    redirect_to admin_root_path
  end
  
  def post_params
    params.require(:post).permit(:title, :body, :image, :user_id)
  end
end
