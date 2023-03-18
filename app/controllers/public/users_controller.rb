class Public::UsersController < ApplicationController
  def show
    @user = current_user
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_my_page_path
    else
      render :edit
    end
  end
  
  def unsubscribe
    @user = current_user
  end
  
  def withdraw
    @user = current_user
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
  def user_params
    params.require(:user).permit(:name, :name_kana, :email, :is_deleted)
  end
end
