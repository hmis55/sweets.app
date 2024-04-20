class Admin::PostCommentsController < ApplicationController
 before_action :authenticate_admin!

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
end
