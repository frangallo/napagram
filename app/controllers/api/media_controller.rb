class Api::MediaController < ApplicationController
  def create
    @post = Medium.new(media_params)
    @post.author_id = current_user.id
    if @post.save
      render json: @post
    else
      render json: @post.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @post = Medium.find(params[:id])
    if @post.update(media_params)
      render json: @post
    else
      render json: @post.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Medium.find(params[:id])
    @post.destroy
    render json: {}
  end

  def index
  end

  def show
  end

  private

  def media_params
    params.require(:media).permit(:location, :description)
  end

end
