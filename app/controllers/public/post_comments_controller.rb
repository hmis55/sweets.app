class Public::PostCommentsController < ApplicationController
 before_action :authenticate_user!
 before_action :ensure_guest_user

  def create
  post = Post.find(params[:post_id])
  comment = current_user.post_comment.new(post_comment_params)
  comment.post_id = post.id
  comment.save
  end


  def destroy
    post_comment = PostComment.find(params[:id])
    post_comment.destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
  def ensure_guest_user
    if current_user.email == "guest@example.com"
      redirect_to user_path(current_user), notice: "この機能は会員登録後に使用可能となります。"
    end
  end

end
