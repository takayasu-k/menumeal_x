class ShopDetailsController < ApplicationController
	
	def new
		@shop_detail = ShopDetail.new()
	end
	
	def create
		@shop_detail = ShopDetail.new(
#		shop_id = params[:shop][:id],
		
		)
	end
	
	def show
		#@shop_detail = Shop_detail.find_by(shop_id: p
	end
	
	def edit
	end
	
	def update
	end
	
	def destroy
	end
end
