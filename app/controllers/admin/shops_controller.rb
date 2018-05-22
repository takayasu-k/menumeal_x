class Admin::ShopsController < Admin::ApplicationController

  # def index
  #   @shops = Shop.all
  # end

  def index
    @q = Shop.ransack(search_params)
    @shops = @q.result(distinct: true)
  end

  def new
    @shop = Shop.new()
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.save
    @shop_detail = ShopDetail.new(
      shop_id: @shop.id
    )
    @shop_detail.save
    redirect_to admin_shop_path(@shop.id)
  end

  def show
    @shop = Shop.find_by(id: params[:id])
    @shop_detail = ShopDetail.find_by(shop_id: params[:id])
  end

  def edit
    @shop = Shop.find_by(id: params[:id])
  end

  def update
    @shop = Shop.find_by(id: params[:id])
    @shop.update(shop_params)
    redirect_to admin_shop_path
  end

  def destroy
    @shop.find_by(id: params[:id])
    @shop.destroy
    redirect_to admin_shop_path
  end

  def shop_menu # shopに紐づくmenuの一覧表示
    @shop = Shop.find_by(id: params[:id])
    @shop_menus = @shop.menus # 関連付けを利用して店舗に紐づくメニューを取得
  end

  private

    def shop_params
      params.require(:shop).permit(:name, :kana, :address, :tel, :prof_picture, :tkg_flg, :prefecture_id)
    end

    def search_params
      params.require(:q).permit(:name_cont)
    end
end