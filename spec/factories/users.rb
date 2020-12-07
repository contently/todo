# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |k| "someemail-#{k.to_s.rjust(3, '0')}@example.com" }
    password { '123456' }
  end
end
