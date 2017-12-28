class AddColumnToShopDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :shop_details, :holiday, :string, after: :operating_hours
  end
end
