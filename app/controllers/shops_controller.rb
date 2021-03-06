class ShopsController < ApplicationController

  def search_by_prefecture
    @shops = Shop.where('tkg_flg = 1 AND prefecture_id = ?', params[:prefecture_id])
    render json: @shops, only:[:id, :name, :address, :tel, :prof_picture]
  end

  def search_by_keyword
    keywords = params[:q].gsub(/¥s|　/, ' ').split(" ") unless params[:q].blank?
    if keywords.present?
      keywords.each_with_index do |keyword, i|
        if i == 0
          @shops = Shop.where('name LIKE ?', "%#{keyword}%")
          next
        end
        @shops = @shops.where('name LIKE ?', "%#{keyword}%")
      end
      @shops = @shops.where('tkg_flg = 1')
    end
    render json: @shops, only:[:id, :name, :address, :tel, :prof_picture]
  end

  def shop_detail
    @shop_detail = ShopDetail.find_by(shop_id: params[:id])
    render json: @shop_detail, only:[:operating_hours, :holiday, :payment]
  end

  def shop_menu
    @menus = Menu.where(shop_id: params[:id])
    render json: @menus, only:[:id, :name, :price, :type, :prof_picture]
  end

end