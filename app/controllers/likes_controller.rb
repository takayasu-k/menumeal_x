class LikesController < ApplicationController

  def create
    @like = current_user.likes.create(review_id: params[:review_id])
    redirect_to review_path(params[:review_id])
  end

  def destroy
    current_user.likes.find_by(review_id: params[:id]).destroy
    redirect_to review_path(params[:id])
  end

end
