FactoryGirl.define do
  factory :post do
    category
    site { category.site }
    user
    title "Title"
    content "Content"
  end

end
