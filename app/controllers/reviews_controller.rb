class ReviewsController < ApplicationController

  def index
    @reviews = Review.all.order(created_at: :desc)
  end

  def new
    @review = Review.new()
  end

  def create
    @review = Review.new()
    @review.save
    redirect_to "/review"
  end

  def show
    @review = Review.find_by(id: params[:id])
  end

  def edit
    @review = Review.find_by(id: params[:id])
  end

  def update
    @review = Review.find_by(id: params[:id])
    @review.menu_id = params[:menu_id]
    @review.picture = params[:picture]
    @review.content = params[:content]
    @review.save
    redirect_to "/review/#{@review.id}"
  end

  def destroy
    @review = Review.find_by(id: params[:id])
    @review.destroy
    redirect_to "/review"
  end
end
