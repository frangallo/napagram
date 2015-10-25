class Api::UsersController < ApplicationController
  def index
    @users = Users.all
    render :index
  end
  
end
