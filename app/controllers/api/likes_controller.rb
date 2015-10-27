class Api::LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)
    if @like.save
      render json: @like
    else
      render json: {message: 'failure'}, status: 422
    end
  end

  def show
    @like= Like.find(params[:id])
    render json: @like
  end

  def destroy
    @like= Like.find(params[:id])
    @like.destroy!
    render json: {}
  end

  private

  def like_params
    params.require(:like).permit(:media_id)
  end

end
