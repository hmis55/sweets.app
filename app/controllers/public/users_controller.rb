class Public::UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    
  end

  def edit
  end

  def unsubscribe
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end