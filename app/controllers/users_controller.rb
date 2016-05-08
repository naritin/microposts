class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]
  before_action :user_login_check, only: [:edit, :update]
  
  def show # 追加
   #@user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    #@user = User.find(params[:id])
  end

  def update
    #@user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "ユーザー情報を更新したよ！"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
  
  def user_login_check
   unless logged_in?
    flash[:danger] = "ちゃんとログインしようね！"
    redirect_to login_path
    return
   end
   
   if current_user != set_user
    flash[:danger] = "他のユーザー情報は編集できません。"
     redirect_to root_path
   end
  end

  def logged_in_user
   
  end

end