class Api::PicturesController < ApplicationController
  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      render :show
    else
      render json: {message: 'failure'}, status: 422
    end
  end

  def show
    @picture= Picture.find(params[:id])
    render :show
  end

  def destroy
    @picture= Picture.find(params[:id])
    @picture.destroy!
    render json: {}
  end

  private

  def picture_params
    params.require(:picture).permit(:url, :thumb_url, :imageable_id, :imageable_type)
  end
end
