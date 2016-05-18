class ChangeImageToRestaurants < ActiveRecord::Migration
  def up
    change_column :Restaurants, :image, :text
  end
  def down
    change_column :Restaurants, :image, :string
  end
end
