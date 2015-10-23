class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by_credentials(params[:user][:username],
                                    params[:user][:password])

    if user
      login_user!(user)
      render :text => "Success"
    else
      flash.now[:errors] = ["Invalid Credentials"]
      render :new
    end
  end

  def destroy
    @user = current_user
    logout_user!
    render json: @user
  end

end
