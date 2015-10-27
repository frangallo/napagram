class Api::UsersController < ApplicationController
  def index
    @users = User.includes(:picture, :followers, :following, posts: [:likers, :comments, :author, :picture, :likes]).all
    if logged_in?
        @following_hash = current_user.photo_likes_hash
    else
        @following_hash = {}
    end

    render :index
  end

  def show
    @user = User.includes(:picture, :followers, :following, posts: [:likers, :comments, :author, :picture, :likes]).find(params[:id])
    @following_hash = {}
    if logged_in?
      @following_hash[@user.id] = @user.passive.find_by(user_id: current_user.id)
    end
    render :show
  end

end
