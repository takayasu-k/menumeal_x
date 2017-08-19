class AddKanaToShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :kana, :string
  end
end
