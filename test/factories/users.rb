FactoryGirl.define do
  sequence(:email) { |n| "user_#{n}@example.com" }
  sequence(:name) { |n| "user_#{n}" }

  factory :user do
    name
    email
    password "password"

    factory :admin do
      admin true
    end
  end



end
