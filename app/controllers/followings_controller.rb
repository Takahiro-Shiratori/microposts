class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
    @followings = @user.following_users
    @followers = @user.follower_users
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
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def followings
    @user = User.find(params[:id])
    @followings_users = @user.following_users
  end
  
  def followers
    @user = User.find(params[:id])
    @followers_users = @user.follower_users
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :location, :description, :password,
                                 :password_confirmation)
  end
end