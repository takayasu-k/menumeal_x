class EatenMenusController < ApplicationController

  def create
    menu = Menu.find(params[:id])
    current_user.register_eaten_menu(menu)
    redirect_to menu
  end
  
  def destroy
    menu = EatenMenu.find_by(menu_id: params[:id])
    current_user.remove_eaten_menu(menu)
    redirect_to menu
  end

end
