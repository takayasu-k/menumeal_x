class TopController < ApplicationController
  def index
    @reviews = Review.limit(15)
  end

  def about
  end

  def show
  end
end
