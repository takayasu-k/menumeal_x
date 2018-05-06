class RenameColumnToShop < ActiveRecord::Migration[5.0]
  def change
    rename_column :shops, :pref_id, :prefecture_id
  end
end
