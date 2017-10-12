FactoryGirl.define do
  factory :menu do
    name "Menu"
  end

  factory :menu_with_dishes, :parent => :menu do |restaurant|
    dishes { build_list :dish, 3 }

  end

end
