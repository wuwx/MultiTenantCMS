FactoryGirl.define do
  factory :comment do
    user
    association :commentable, factory: :post
    content "Content"
  end

end
