class LikesController < ApplicationController

  def create
    @like = Like.new(user_id: current_user, review_id: params[:format])
    @like.save
    redirect_to review_path(@like.review_id)
  end

  def destroy
    current_user.likes.find_by(review_id: params[:id]).destroy
    redirect_to review_path(params[:id])
  end

end
