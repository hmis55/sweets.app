class Public::UsersController < ApplicationController
before_action :is_matching_login_user, only: [:edit, :update, :withdraw]
before_action :ensure_guest_user, only: [:edit]

  def mypage
    @user = current_user
    @posts = current_user.post
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
      redirect_to mypage_users_path, notice: "編集が成功しました!"
    else
      render :edit
    end
  end

  #退会機能
  def withdraw
    @userr = User.find(current_user.id)
    @current_user.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def user_params
   params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def post_params
    params.require(:post).permit(:title, :body, :image, :user_id)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to new_user_session_path
    end
  end

  def ensure_guest_user
    if current_user.email == "guest@example.com"
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end
end
