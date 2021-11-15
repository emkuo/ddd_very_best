class CreateFavoritedDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :favorited_dishes do |t|
      t.text :name
      t.text :cuisine
      t.integer :venues_id
      t.integer :user_id

      t.timestamps
    end
  end
end
