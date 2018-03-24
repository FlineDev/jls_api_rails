FactoryBot.define do
  factory :user, aliases: [:creator] do
    nickname Faker::DragonBall.character
    email { Faker::Internet.email(nickname) }
  end
end
