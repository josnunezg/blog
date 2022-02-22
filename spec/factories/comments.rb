FactoryBot.define do
  factory :comment do
    body { Faker::Lorem.characters }
    post { create(:post) }
    user { create(:user) }
  end
end
