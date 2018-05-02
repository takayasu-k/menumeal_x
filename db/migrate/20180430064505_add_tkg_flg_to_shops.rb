class AddTkgFlgToShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :tkg_flg, :int, default:0
  end
end
