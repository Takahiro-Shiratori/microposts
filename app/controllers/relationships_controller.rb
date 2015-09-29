class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
  end

  def destroy
    @user = current_user.following_relationships.find(params[:id]).followed
    current_user.unfollow(@user)
    
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
    @followings = @user.following_users
    @followers = @user.follower_users
  end
  
  end
end