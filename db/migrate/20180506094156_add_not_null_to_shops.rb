class AddNotNullToShops < ActiveRecord::Migration[5.0]
  def change
    change_column_null :shops, :tkg_flg, false
  end
end
