class Admin::UsersController < ApplicationController
  before_action :not_admin
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all.includes(:tasks)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "ユーザーを作成しました"
    else
      render :new
    end
  end

  def edit
  end

  def show
    @tasks = @user.tasks
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "ユーザーを編集しました"
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to admin_users_path, notice: "ユーザーを削除しました"
    else
      redirect_to admin_users_path
    end
  end

  private
  def not_admin
    unless current_user.admin?
      redirect_to tasks_path, notice: "管理者以外はアクセスできません"
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
