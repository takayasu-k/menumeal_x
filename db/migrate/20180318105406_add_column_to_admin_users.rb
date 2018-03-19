class AddColumnToAdminUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :admin_users, :name, :string
    add_column :admin_users, :authority, :int, default:0
  end
end
