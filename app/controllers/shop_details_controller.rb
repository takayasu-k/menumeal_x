class ShopDetailsController < ApplicationController

	def new
    @shop = Shop.find_by(id: params[:id])
    @shops = Shop.all
		@shop_detail = ShopDetail.new()
	end

	def create
		@shop_detail = ShopDetail.new()
		@shop_detail.shop_id = params[:shop_detail][:shop_id]
    @shop_detail.access = params[:shop_detail][:access]
    @shop_detail.parking = params[:shop_detail][:parking]
    @shop_detail.operating_hours = params[:shop_detail][:operating_hours]
    @shop_detail.holiday = params[:shop_detail][:holiday]
    @shop_detail.budget = params[:shop_detail][:budget]
    @shop_detail.payment = params[:shop_detail][:payment]
    @shop_detail.seats = params[:shop_detail][:seats]
    @shop_detail.private_room = params[:shop_detail][:private_room]
    @shop_detail.smoking = params[:shop_detail][:smoking]
    @shop_detail.bar = params[:shop_detail][:bar]

    @shop_detail.save
    redirect_to shop_path(@shop_detail.shop_id)
	end

	def show
		#@shop_detail = Shop_detail.find_by(shop_id: p
	end

	def edit
    @shop = Shop.find_by(id: params[:id])
    @shop_detail = ShopDetail.find_by(shop_id: params[:id])
	end

	def update
    @shop_detail = ShopDetail.find_by(shop_id: params[:id])
    @shop_detail.access = params[:shop_detail][:access]
    @shop_detail.parking = params[:shop_detail][:parking]
    @shop_detail.operating_hours = params[:shop_detail][:operating_hours]
    @shop_detail.budget = params[:shop_detail][:budget]
    @shop_detail.payment = params[:shop_detail][:payment]
    @shop_detail.seats = params[:shop_detail][:seats]
    @shop_detail.private_room = params[:shop_detail][:private_room]
    @shop_detail.smoking = params[:shop_detail][:smoking]
    @shop_detail.bar = params[:shop_detail][:bar]
    @shop_detail.holiday = params[:shop_detail][:holiday]

    @shop_detail.save
    redirect_to "/shops/#{@shop_detail.shop_id}"
	end

	def destroy
	end
end
