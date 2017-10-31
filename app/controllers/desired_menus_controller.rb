class DesiredMenusController < ApplicationController

  def create
    menu = Menu.find(params[:menu_id])
    current_user.register_desired_menu(menu)
    redirect_to menu
  end

  def destroy
    desired_menu = current_user.desired_menus.find_by(menu_id: params[:id])
    desired_menu.destroy
    redirect_to menu_path(params[:id])
  end

end
