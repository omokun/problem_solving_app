FactoryBot.define do
  factory :main_issue do
    title               { Faker::Lorem.sentence }
    conclusion          { Faker::Lorem.sentence }
    association :user 
  end
end
