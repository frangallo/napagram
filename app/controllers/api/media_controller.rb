class Api::MediaController < ApplicationController
  def create
    @post = current_user.posts.new(media_params)
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

  def edit
    @post = Medium.find(params[:id])
    render json: @post
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.try(:destroy)
    render json: {}
  end

  def index
    @posts = current_user.feed
    if logged_in?
        @likes_hash = current_user.photo_likes_hash
      else
        @likes_hash = {}
      end
      render :index
    end
  end

  def profile_index
    @posts = Medium.includes(:likes, :likers, :author, :picture, comments: [:author]).where(author_id: params[:author_id])
    if logged_in?
        @likes_hash = current_user.photo_likes_hash
    else
        @likes_hash = {}
    end

    render :index
  end

  def show
    @post = Medium.includes(:likes, :likers, :author, :picture, comments: [:author]).find(params[:id])
    render :show
  end

  private

  def media_params
    params.require(:media).permit(:location, :description)
  end

end
