class DesiredMenusController < ApplicationController

  def create
    @desired_menu = current_user.desired_menus.create(menu_id: params[:id])
    redirect_to menu_path(params[:menu_id])
  end

  def destroy
    current_user.desired_menus.find_by(menu_id: params[:id]).destroy
    redirect_to menu_path(params[:id])
  end

end
