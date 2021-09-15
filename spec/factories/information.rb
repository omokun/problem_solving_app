FactoryBot.define do
  factory :information do
    content { Faker::Lorem.sentence }
    association :sub_issue
  end
end
