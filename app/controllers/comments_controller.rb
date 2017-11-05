class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.create(review_id: params[:review_id], content: params[:content])
    redirect_to review_path(params[:review_id])
  end

  def destroy
    current_user.comments.find_by(id: params[:comment_id]).destroy
    redirect_to review_path(params[:review_id])
  end

end
