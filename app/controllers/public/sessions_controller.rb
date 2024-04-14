# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
   before_action :reject_user, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  def after_sign_in_path_for(resource)
      user_path(current_user)
  end

  def after_sign_out_path_for(resource)
     about_path
  end

  def reject_user
        @user = User.find_by(email: params[:user][:email])
        if @user
          if @user.valid_password?(params[:user][:password]) && (@user.is_active == false)
            flash[:notice] = "退会済みです。再度ご登録をしてご利用ください"
            redirect_to new_user_registration_path
          else
            flash[:notice] = "項目を入力してください"
          end
        else
            flash[:notice] = "該当するユーザーが見つかりません"
        end
  end

  def user_params
      params.require(:user).permit(:name, :email)
  end


  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
