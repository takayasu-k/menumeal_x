class EatenMenusController < ApplicationController

  def create
   menu = Menu.find(params[:menu_id])
   current_user.register_eaten_menu(menu)
   redirect_to menu
 end

  def destroy
    eaten_menu = current_user.eaten_menus.find_by(menu_id: params[:id])
    eaten_menu.destroy
    redirect_to menu_path(params[:id])
  end

end
