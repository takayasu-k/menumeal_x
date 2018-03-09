class TopController < ApplicationController
  def index
    @reviews = Review.order(created_at: :desc).limit(15)
    @menus = Menu.limit(2)
    @recommended_reviews = Review.order(updated_at: :desc).limit(2)
    @q = Shop.ransack(params[:q])
  end

  def about
  end

  def show
  end
end
