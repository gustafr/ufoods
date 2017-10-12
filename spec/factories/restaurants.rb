FactoryGirl.define do
  factory :restaurant do
    sequence :name do |n|
      "Restaurant#{n}"
    end
    sequence :address do |n|
      "street #{n}"
    end
    sequence :description do |n|
      "a restaurant #{n}"
    end

    factory :restaurant_with_category do
      transient do
        category_name 'My category'
      end

      after(:create) do |restaurant, evaluator|
        create_list(:restaurant_category, 1, name: evaluator.category_name)
      end

    end

    factory :restaurant_with_associations do
      transient do
        res_category_name 'My category'
        menu_name 'My menu'
      end

      after(:create) do |restaurant, evaluator|
        create_list(:restaurant_category, 1, name: evaluator.res_category_name, restaurant_ids: restaurant.id)
        create_list(:menu_with_dishes, 1, name: evaluator.menu_name, restaurant: restaurant)
      end

    end

  end

  factory :restaurant_with_menus_and_categories, :parent => :restaurant_with_category do |restaurant|
    menus { build_list :menu, 3 }
  end


end
