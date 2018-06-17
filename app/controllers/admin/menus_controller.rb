class Admin::MenusController < Admin::ApplicationController
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
    @menu = Menu.new(menu_params)
    @menu.save
    redirect_to admin_shop_menu_path(@menu.shop_id)
  end

  def edit
    @menu = Menu.find_by(id: params[:id])
    @shops = Shop.all

  end

  def update
    @menu = Menu.find_by(id: params[:id])
    @menu.update(menu_params)
    redirect_to admin_shop_menu_path(@menu.shop_id)
  end

  def destroy
    @menu = Menu.find_by(id: params[:id])
    shop_id = @menu.shop_id
    @menu.destroy
    redirect_to admin_shop_menu_path(shop_id)
  end

  private

  def menu_params
    params.require(:menu).permit(:shop_id, :name, :price, :menu_type, :prof_picture)
  end
end
