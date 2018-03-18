class CheeringsController < ApplicationController
    def create
        @cheering = current_user.cheerings.create(shop_id: params[:shop_id])
        redirect_to shop_path(params[:shop_id])
      end
    
      def destroy
        current_user.cheerings.find_by(shop_id: params[:id]).destroy
        redirect_to shop_path(params[:id])
      end
    
end
