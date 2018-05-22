class Admin::ShopDetailsController < Admin::ApplicationController

	def edit
    @shop = Shop.find_by(id: params[:id])
    @shop_detail = ShopDetail.find_by(shop_id: params[:id])
	end

	def update
    @shop_detail = ShopDetail.find_by(shop_id: params[:id])
    @shop_detail.update(shop_detail_params)
    redirect_to admin_shop_path(@shop_detail.shop_id)
  end
    
  private
 
  def shop_detail_params
    params.require(:shop_detail).permit(:access, :parking, :operating_hours, :budget, :payment,
      :seats, :private_room, :smoking, :bar, :holiday)
  end
end
