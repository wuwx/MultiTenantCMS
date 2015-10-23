FactoryGirl.define do
  factory :comment do
    user
    post
    content "Content"
  end

end
