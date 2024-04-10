class Public::UsersController < ApplicationController


  def show
  @user = User.find(params[:id])
  @posts = Post.all
  end

  def edit
  end

  def unsubscribe
  end
end