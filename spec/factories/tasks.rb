# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    name { 'MyString' }
    completed { false }
  end
end
