FactoryBot.define do
  factory :post do
    title { Faker::FunnyName.name }
    body { Faker::Lorem.characters(500) }
    user { create(:user) }
  end
end
