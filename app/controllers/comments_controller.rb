class CommentsController < ApplicationController

  def new
    @comment = Comment.new()
    @review = Review.find_by(id: params[:review_id])
  end

  def create
    @comment = Comment.new(user_id: current_user, review_id: params[:reveiw_id],
    content: params[:comment][:content])
    if @comment.save
      redirect_to reviews_path
    end

  end

  def destroy
    current_user.comments.find_by(id: params[:comment_id]).destroy
    redirect_to review_path(params[:review_id])
  end

end
