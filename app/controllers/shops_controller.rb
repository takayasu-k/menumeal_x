class ShopsController < ApplicationController

  def index
    @shops = Shop.all
  end

  def new
    @shop = Shop.new()
  end

  def create
    @shop = Shop.new(
    name: params[:shop][:name],
    kana: params[:shop][:kana],
    address: params[:shop][:address],
    tel: params[:shop][:tel],
    prof_picture: "default.jpg"
    )
    @shop.save
    redirect_to "/shops/#{@shop.id}"
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
    @shop.name = params[:shop][:name]
    @shop.kana = params[:shop][:kana]
    @shop.address = params[:shop][:address]
    @shop.tel = params[:shop][:tel]
    if params[:shop][:image] # ショップの画像ファイルが有る場合のみ処理
      @shop.prof_picture = "#{@shop.id}.jpg"
      image = params[:shop][:image]
      File.binwrite("public/shop_prof_images/#{@shop.prof_picture}", image.read)
    end
    @shop.save
    redirect_to "/shops/#{@shop.id}"
  end

  def destroy
    @shop.find_by(id: params[:id])
    @shop.destroy
    redirect_to "/shop"
  end

  def shop_menu # shopに紐づくmenuの一覧表示
    @shop = Shop.find_by(id: params[:id])
    @shop_menus = @shop.menus # 関連付けを利用して店舗に紐づくメニューを取得
  end
end
