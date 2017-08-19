class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :tel
      t.string :prof_picture

      t.timestamps
    end
  end
end
