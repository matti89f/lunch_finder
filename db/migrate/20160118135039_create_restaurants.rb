class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string  :name
      t.string  :website
      t.string  :image
      t.string  :opening
      t.string  :location
      t.float   :latitude 
      t.float   :longitude 
      t.boolean :vegan
      t.text    :comments

      t.timestamps null: false
    end
  end
end
