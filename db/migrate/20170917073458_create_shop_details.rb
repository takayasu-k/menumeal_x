class CreateShopDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_details do |t|
      t.integer :shop_id
      t.string :access
      t.string :parking
      t.string :operating_hours
      t.string :budget
      t.string :payment
      t.integer :seats
      t.string :private_room
      t.string :smoking
      t.string :bar

      t.timestamps
    end
  end
end
