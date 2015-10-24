FactoryGirl.define do
  factory :comment do
    user
    association :commentable, factory: :post
    site { commentable.site }
    content "Content"
  end

end
