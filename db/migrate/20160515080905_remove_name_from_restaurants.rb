class RemoveNameFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :name, :string
  end
end
