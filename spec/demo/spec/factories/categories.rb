FactoryBot.define do
  factory :category do
    sequence(:name) { |n| Faker::Team.sport + n.to_s }
  end
end
