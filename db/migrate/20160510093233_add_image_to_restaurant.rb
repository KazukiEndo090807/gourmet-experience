class AddImageToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :image, :text
  end
end
