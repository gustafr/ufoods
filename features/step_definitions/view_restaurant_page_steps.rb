Given("the following restaurants exist") do |table|
  table.hashes.each do |hash|
    # res_category = RestaurantCategory.find_by(name: hash[:restaurant_category])
    # res_menu = []
    # res_menu << Menu.find_by(name: hash[:menu])
    # hash.delete_if {|key, value| value == res_category.name }
    # hash.delete_if {|key, value| value == res_menu.first.name }
    # restaurant = FactoryGirl.create(:restaurant, hash)
    # restaurant.update_attribute(:restaurant_category, res_category)
    # restaurant.update_attribute(:menus, res_menu)
    FactoryGirl.create(:restaurant_with_associations, hash)
    binding.pry
  end
end

Given("the following menu exist") do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:menu, hash)
  end
end

Given("the restaurants are associated to categories and menus") do |table|
  table.hashes.each do |hash|
    restaurant = Restaurant.find_by(name: hash[:restaurant_name])
    category = RestaurantCategory.find_by(name: hash[:category])
    menu = Menu.find_by(name: hash[:menu])
    restaurant.update_attributes(menu_ids: menu.id, restaurant_category_id: category.id )
  end
end

