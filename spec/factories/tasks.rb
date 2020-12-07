# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    name { 'MyString' }
    completed { false }
    user
    list { |k| create(:list, user: k.user) }
  end
end
