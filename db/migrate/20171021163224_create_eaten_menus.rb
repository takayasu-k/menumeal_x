class CreateEatenMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :eaten_menus do |t|
      t.integer :user_id
      t.integer :menu_id

      t.timestamps
    end
      add_index :eaten_menus, :user_id
      add_index :eaten_menus, :menu_id
      add_index :eaten_menus, [:user_id, :menu_id], unique: true
  end
end
