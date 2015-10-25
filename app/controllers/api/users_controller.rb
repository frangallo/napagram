class Api::UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.includes(:posts).find(params[:id])
    render :show
  end

end
