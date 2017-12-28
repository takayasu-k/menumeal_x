class EatenMenusController < ApplicationController

  def create
    @eaten_menu = current_user.eaten_menus.create(menu_id: params[:menu_id])
    redirect_to menu_path(params[:menu_id])
  end

  def destroy
    current_user.eaten_menus.find_by(menu_id: params[:id]).destroy
    redirect_to menu_path(params[:id])
  end

end
