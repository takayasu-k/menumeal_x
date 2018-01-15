class MenusController < ApplicationController
  def index
  end

  def show
    @menu = Menu.find_by(id: params[:id])
    @reviews = Review.where(menu_id: params[:id]).order(updated_at: :desc)
    @review = @reviews.first
  end

  def new
    @menu = Menu.new()
    @shops = Shop.all
  end

  def create
    @menu = Menu.new()
    @menu.shop_id = params[:menu][:shop_id]
    @menu.name = params[:menu][:name]
    @menu.price = params[:menu][:price]
    @menu.menu_type = params[:menu][:menu_type]
    @menu.save
    redirect_to shop_menu_path(@menu.shop_id)
  end

  def edit
    @menu = Menu.find_by(id: params[:id])
    @shops = Shop.all

  end

  def update
    @menu = Menu.find_by(id: params[:id])
    @menu.shop_id = params[:menu][:shop_id]
    @menu.name = params[:menu][:name]
    @menu.price = params[:menu][:price]
    @menu.menu_type = params[:menu][:menu_type]
    @menu.save
    redirect_to shop_menu_path(@menu.shop_id)
  end

  def destroy
    @menu = Menu.find_by(id: params[:id])
    shop_id = @menu.shop_id
    @menu.destroy
    redirect_to shop_menu_path(shop_id)
  end
end
