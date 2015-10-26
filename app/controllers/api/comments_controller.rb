class Api::CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: {message: 'failure'}, status: 422
    end
  end

  def show
    @comment= Comment.find(params[:id])
    render json: @comment
  end

  def destroy
    @comment= Comment.find(params[:id])
    @comment.destroy!
    render json: {}
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :author_id, :media_id)
  end
end

end
