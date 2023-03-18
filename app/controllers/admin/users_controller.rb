class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end
  def user_params
    params.require(:user).permit(:email, :name, :name_kana, :email, :is_deleted)
  end
end
