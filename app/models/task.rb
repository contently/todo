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
#


class Task < ActiveRecord::Base
  validates :name, :list_id, presence: true
  validates :completed, inclusion: { in: [true, false] }

  belongs_to :list,
    class_name: :List,
    foreign_key: :list_id,
    primary_key: :id

  has_one :author,
    through: :list,
    source: :list
  end
