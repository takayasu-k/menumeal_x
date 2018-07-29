class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  # def index
  #   following_user_ids = current_user.following.ids
  #   @reviews = Review.where(user_id: following_user_ids).order(created_at: :desc)
  # end

  def index
    @review_user = Review.search_by_menu(params[:id])
    render json: @review_user, except:[:id]
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.save
    @review_user = Review.search_by_menu(@review.menu_id)
    render json: @review_user, except:[:id]
  end

  # def show
  #   @review = Review.find_by(id: params[:id])
  # end

  def update
    @review = Review.find_by(id: params[:id])
    @review.update(review_params)
    @review_user = Review.search_by_menu(@review.menu_id)
    render json: @review_user, except:[:id]
  end

  def destroy
    @review = Review.find_by(id: params[:id])
    @review.destroy
    @review_user = Review.search_by_menu(@review.menu_id)
    render json: @review_user, except:[:id]
  end

  private

  def review_params
    params.require(:review).permit(:menu_id, :picture, :content)
  end
end
