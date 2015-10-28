class Api::CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_parms)
    if @comment.save
      render json: @comment
    else
      render json: {message: 'failure'}, status: 422
    end
  end

  def show
    @comment= Comment.find(params[:id])
    render :show
  end

  def destroy
    @comment= Comment.find(params[:id])
    @comment.destroy!
    render json: {}
  end

  def index
    @comments = Comment.all
    render :index
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :media_id)
  end
end
