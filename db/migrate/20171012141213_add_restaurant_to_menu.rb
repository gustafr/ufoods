class AddRestaurantToMenu < ActiveRecord::Migration[5.1]
  def change
    add_reference :menus, :restaurant, foreign_key: true
  end
end
