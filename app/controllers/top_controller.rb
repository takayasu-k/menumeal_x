class TopController < ApplicationController
  def index
    @reviews = Review.limit(15)
    @menus = Menu.limit(2)
  end

  def about
  end

  def show
  end
end
