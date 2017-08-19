class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :menu_id
      t.string :picture
      t.string :content

      t.timestamps
    end
  end
end
