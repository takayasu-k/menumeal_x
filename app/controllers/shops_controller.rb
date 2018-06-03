class ShopsController < ApplicationController

  def search
    @shops = Shop.where('tkg_flg = 1 AND prefecture_id = ?', params[:prefecture_id])
    render json: @shops, only:[:id, :name, :address, :prof_picture]
  end

end