FactoryGirl.define do
  factory :site do
    name "wuwx"
    title "测试站点"
    association :user
  end

end
