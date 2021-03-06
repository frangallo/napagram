class Api::CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    p @comment
    if @comment.save
      render :show
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
