FactoryBot.define do
  factory :challenge do
    title Faker::Lorem.sentence(2)
    description Faker::Lorem.paragraph
    end_time { [Faker::Time.forward(23, :evening), nil].sample }
    type { ['tournament', 'season', 'open'].sample }
    category
    creator
  end
end
