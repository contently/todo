# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  name       :string
#  completed  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  list_id    :integer
#


FactoryBot.define do
  factory :task do
    name { 'MyString' }
    completed { false }
  end
end
