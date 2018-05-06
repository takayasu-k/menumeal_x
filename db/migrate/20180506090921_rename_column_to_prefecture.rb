class RenameColumnToPrefecture < ActiveRecord::Migration[5.0]
  def change
    rename_column :prefectures, :pref_id, :prefecture_id
  end
end
