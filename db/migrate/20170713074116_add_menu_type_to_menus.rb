class AddMenuTypeToMenus < ActiveRecord::Migration[5.0]
  def change
    add_column :menus, :menu_type, :integer
  end
end
