class RemoveImageFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :Image, :text
  end
end
