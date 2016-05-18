class AddImageToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :Image, :text
  end
end
