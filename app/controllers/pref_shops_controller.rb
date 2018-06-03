class PrefShopsController < ApplicationController

  #[TKG]都道府県ごとの店舗数を取得
  def search
    @pref_shops = Shop
                  .left_outer_joins(:prefecture)
                  .select('shops.prefecture_id as pref_id, prefectures.name as pref_name, count(shops.id) as shop_count')
                  .where(tkg_flg: 1).where.not(prefecture_id: 0)
                  .group('prefecture_id')
    render json: @pref_shops
  end

end
