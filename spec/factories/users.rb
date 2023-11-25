FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    photo { Faker::Avatar.image }
    bio { Faker::Lorem.sentence }

    transient do
      posts_count { 5 }
    end

    after(:create) do |user, evaluator|
      create_list(:post, evaluator.posts_count, user:)
    end
  end
end
