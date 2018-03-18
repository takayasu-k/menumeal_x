class CreateCheerings < ActiveRecord::Migration[5.0]
  def change
    create_table :cheerings do |t|
      t.integer :user_id
      t.integer :shop_id

      t.timestamps
    end
  end
end
