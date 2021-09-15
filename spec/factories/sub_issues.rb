FactoryBot.define do
  factory :sub_issue do
    title               { Faker::Lorem.sentence }
    hypothesis          { Faker::Lorem.sentence }
    new_hypothesis      { Faker::Lorem.sentence }
    sub_conclusion      { Faker::Lorem.sentence }
    association :main_issue 
  end
end
