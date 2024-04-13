class Public::PostCommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    comment = current_user.post_comment.new(post_comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post)
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

end