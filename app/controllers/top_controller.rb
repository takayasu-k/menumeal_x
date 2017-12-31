class TopController < ApplicationController
  def index
    @reviews = Review.limit(9)
  end

  def about
  end

  def show
  end
end
