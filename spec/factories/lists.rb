# frozen_string_literal: true

FactoryBot.define do
  factory :list do
    user
    name { Faker::Lorem.word }

    trait :with_tasks do
      after(:create) { |list| create_list(:task, 3, list: list, user: list.user) }
    end
  end
end
