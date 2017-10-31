class DesiredMenusController < ApplicationController

  def create
    menu = Menu.find(params[:menu_id])
    current_user.register_desired_menu(menu)
    redirect_to menu
  end

  def destroy
    menu = DesiredMenu.find_by(menu_id: params[:menu_id])
    current_user.remove_desired_menu(menu)
    redirect_to menu
  end

end
