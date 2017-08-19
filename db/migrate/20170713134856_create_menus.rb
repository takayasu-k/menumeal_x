class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.integer :shop_id
      t.string :name
      t.integer :price
      t.integer :status, default: 0, null: false
      t.integer :menu_type, default: 0, null: false

      t.timestamps
    end
  end
end
