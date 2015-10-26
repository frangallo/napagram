class Api::UsersController < ApplicationController
  def index
    @users = User.includes(:picture, :followers, :following, posts: [:likers, :comments, :author, :picture, :likes]).all
    render :index
  end

  def show
    @user = User.includes(:picture, :followers, :following, posts: [:likers, :comments, :author, :picture, :likes]).find(params[:id])
    render :show
  end

end
