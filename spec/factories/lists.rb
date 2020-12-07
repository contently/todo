# frozen_string_literal: true

FactoryBot.define do
  factory :list do
    sequence(:name) { |k| "List-#{k}" }
    user
  end
end
