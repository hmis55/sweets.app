class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user, only: [:create, :destroy]


  def create
    post = Post.find(params[:post_id])
    comment = current_user.post_comment.new(post_comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path
  end

  def destroy
    post_comment = PostComment.find(params[:id])
    post_id = post_comment.post_id
    post_comment.destroy
    redirect_to post_path(post_id)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

  def is_matching_login_user
    unless current_user
      redirect_to new_user_session_path
      return
    end
  
    if params[:id].present?
      post = Post.find(params[:id])
      unless post.user_id == current_user.id
        redirect_to root_path
      end
    end
  end

end
