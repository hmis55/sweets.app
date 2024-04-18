class Admin::UsersController < ApplicationController
before_action :authenticate_admin!

  def index
    @users = User.all
  end


  def show
    @user = User.find(params[:id])
    @posts = @user.post
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user.id), notice: "編集が成功しました."
    else
      render :edit
    end
  end


  private

  def user_params
   params.require(:user).permit(:name, :email, :password, :password_confirmation, :is_active)
  end

  def post_params
    params.require(:post).permit(:title, :body, :image, :user_id)
  end

end
