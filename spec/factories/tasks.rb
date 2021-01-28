# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    user
    name { Faker::Lorem.sentence }

    trait :incomplete do
      completed { false }
    end

    trait :completed do
      after(:create) { |task| task.update(completed: true) }
    end
  end
end
