FactoryGirl.define do
  factory :link do
    url "Url"
    name "Name"
    association :site, factory: :site
  end

end
