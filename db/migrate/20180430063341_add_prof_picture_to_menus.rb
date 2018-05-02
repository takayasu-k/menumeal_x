class AddProfPictureToMenus < ActiveRecord::Migration[5.0]
  def change
    add_column :menus, :prof_picture, :string
  end
end
