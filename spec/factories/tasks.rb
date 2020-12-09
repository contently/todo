# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    association :user
    name { 'MyString' }
    completed { false }
  end
end
