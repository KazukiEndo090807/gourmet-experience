class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string    :name
      t.string    :r_name
      t.string    :place
      t.string    :food
      t.string    :price
      t.text      :review
      t.timestamps
    end
  end
end
