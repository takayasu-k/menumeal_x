class ReviewsController < ApplicationController

  def index
    following_user_ids = current_user.following.ids
    @reviews = Review.where(user_id: following_user_ids).order(created_at: :desc)
  end

  def new
    @review = Review.new()
    @menus = Menu.all
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.save
    redirect_to reviews_path
  end

  def show
    @review = Review.find_by(id: params[:id])
  end

  def edit
    @review = Review.find_by(id: params[:id])
  end

  def update
    @review = Review.find_by(id: params[:id])
    @review.update(review_params)
    redirect_to "/review/#{@review.id}"
  end

  def destroy
    @review = Review.find_by(id: params[:id])
    @review.destroy
    redirect_to "/review"
  end

  private

  def review_params
    params.require(:review).permit(:menu_id, :picture, :content)
  end
end
