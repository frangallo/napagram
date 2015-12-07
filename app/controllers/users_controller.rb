class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      upload_avatar(@user)
      login_user!(@user)
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def upload_avatar(user)
    puts "Avatar params: #{avatar_url_params}"
    Picture.create({url: avatar_url_params["avatar_url"],
                    thumb_url: avatar_url_params["avatar_url"],
                    imageable_id: (user.id),
                    imageable_type: "User" })
  end


  private

  def user_params
    params.require(:user).permit(:password, :username, :quote)
  end

  def avatar_url_params
    params.require(:user).permit(:avatar_url)
  end

end
