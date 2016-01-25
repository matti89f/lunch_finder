class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :website
      t.string :image_url
      t.string :opening
      t.string :location
      t.boolean :vegan
      t.text :comments

      t.timestamps null: false
    end
  end
end
